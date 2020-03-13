//
//  CellView.swift
//  WTest
//
//  Created by Michael Borgmann on 12.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation
import SwiftUI

enum CellType: String {
    case normal = "Normal"
    case number = "Number"
    case uppercase = "Uppercase"
    
    var keyboard: UIKeyboardType {
        switch self {
        case .number:
            return .decimalPad
        default:
            return .asciiCapable
        }
    }
}

struct CellView: View {
    
    let type: CellType
    let index: Int

    @State var field = ""
    @State var input = ""
    
    @ObservedObject var viewModel = InputViewModel()
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text(type.rawValue)
                .multilineTextAlignment(.leading)
                .frame(width: 100)
            
            TextField(viewModel.items[index], text: $viewModel.items[index])
                .keyboardType(type.keyboard)
                .autocapitalization(type == .uppercase ? .allCharacters : .none)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.gray)
                ).shadow(color: Color.gray.opacity(0.4),
                         radius: 3, x: 1, y: 2)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(type: .normal, index: 0)
    }
}
