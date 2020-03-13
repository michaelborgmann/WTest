//
//  InputView.swift
//  WTest
//
//  Created by Michael Borgmann on 12.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import SwiftUI

struct InputView: View {
    
    @ObservedObject var viewModel = InputViewModel()

    var body: some View {

        List {
        
            ForEach((0..<viewModel.items.count), id: \.self) { index -> CellView in
                switch index % 3 {
                case 1:
                    return CellView(type: .number, index: index)
                case 2:
                    return CellView(type: .uppercase, index: index)
                default:
                    return CellView(type: .normal, index: index)

                }
            }
            
        }
        
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
