//
//  WTestTests.swift
//  WTestTests
//
//  Created by Michael Borgmann on 10.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Quick
import Nimble
@testable import WTest

class WTestTests: QuickSpec {

    override func spec() {
        
        describe("A query for postal codes") {
            
            it("has setup postal code database") {
                expect(PostalCode.all().count).to(beGreaterThan(0))
            }
            
            context("filters for sao joao da talha") {
                
                let desig = "SÃO JOÃO DA TALHA"
                
                it("queries for '2695'") {
                    let result = PostalCode.query(for: "2695")
                    
                    let isFound = result.contains(where: { $0.desigPostal == desig })
                    
                    expect(isFound).to(beTrue())
                }
                
                it("queries for 'São João'") {
                    let result = PostalCode.query(for: "São João".uppercased())
                    
                    let isFound = result.contains(where: { $0.desigPostal == desig })
                    
                    expect(isFound).to(beTrue())
                }
                
            }
            
        }
        
    }

}
