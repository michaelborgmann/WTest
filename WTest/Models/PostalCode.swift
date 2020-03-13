//
//  PostalCode.swift
//  WTest
//
//  Created by Michael Borgmann on 11.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class PostalCode: Object, ObservableObject, Identifiable {

    dynamic var id = UUID().uuidString
    dynamic var numCodPostal = ""
    dynamic var extCodPostal = ""
    dynamic var desigPostal = ""
    
    convenience init(num_cod_postal: String, ext_cod_postal: String, desig_postal: String) {
        self.init()
    
        self.numCodPostal = num_cod_postal
        self.extCodPostal = ext_cod_postal
        self.desigPostal = desig_postal
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<PostalCode> {
        return realm.objects(PostalCode.self)
    }
    
    static func query(for query: String, in realm: Realm = try! Realm()) -> Results<PostalCode> {
        let predicate = NSPredicate(format: "numCodPostal CONTAINS[cd] %@ OR desigPostal CONTAINS[cd] %@", query, query)
        return realm.objects(PostalCode.self).filter(predicate)
    }
    
}
