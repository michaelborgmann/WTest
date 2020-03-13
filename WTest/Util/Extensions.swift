//
//  Extensions.swift
//  WTest
//
//  Created by Michael Borgmann on 11.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import UIKit

extension ArraySlice {
    
    var second: Element? {
        if self.count < 2 {
            return nil
        }
        
        let index = self.startIndex + 1
        return self[index]
    }
    
    var penultimate: Element? {
        if self.count < 2 {
            return nil
        }
        
        let index = self.endIndex - 2
        return self[index]
    }
    
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
