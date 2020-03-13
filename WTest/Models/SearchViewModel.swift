//
//  SearchViewModel.swift
//  WTest
//
//  Created by Michael Borgmann on 11.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import RealmSwift

class SearchViewModel: ObservableObject {
    
    @Published var results: Results<PostalCode> = PostalCode.all()
    @Published var query = "" {
        didSet {
            results = self.query.isEmpty ? PostalCode.all() : PostalCode.query(for: self.query)
        }
    }
}
