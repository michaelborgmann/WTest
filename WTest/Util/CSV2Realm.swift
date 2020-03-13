//
//  CSV2Realm.swift
//  WTest
//
//  Created by Michael Borgmann on 11.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class CSV2Realm {
    
    static let sharedInstance = CSV2Realm()
    
    private let realm: Realm
    private let url = URL(string: "https://github.com/centraldedados/codigos_postais/raw/master/data/codigos_postais.csv")
    
    private init(_ realm: Realm = try! Realm()) {
        self.realm = realm
        debugPrint(Realm.Configuration.defaultConfiguration.fileURL ?? "No Realm")
    }
    
    func delete() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func createPostalCodes() {
        if realm.isEmpty {
            requestPostalCodes()
        }
    }

    
    private func requestPostalCodes() {
            
        Alamofire.request(url!)
            .validate(statusCode: 200..<300)
            .responseString { response in
                switch response.result {
                case .success:
                
                    try! self.realm.write {
                        
                        response.value!
                            .split(separator: "\n")
                            .dropFirst()
                            .forEach { line in
                                self.csv2realm(csv: String(line))
                            }
                            
                        }
                        
                    case let .failure(error):
                        debugPrint("ERROR:", error)
                    }
            }

        }
    
    private func csv2realm(csv: String) {
        let components = csv.components(separatedBy: ",").suffix(3)
        
        let zip = PostalCode(num_cod_postal: components.first!,
                             ext_cod_postal: components.second!,
                             desig_postal: components.last!)
            
        realm.add(zip)
    }

}
