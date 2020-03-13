//
//  BindableResults.swift
//  WTest
//
//  Created by Michael Borgmann on 11.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import RealmSwift

class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {

    var results: Results<Element>
    private var token: NotificationToken!
    
    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
    
}
