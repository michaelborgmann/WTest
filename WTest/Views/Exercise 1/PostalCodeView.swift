//
//  ZipView.swift
//  WTest
//
//  Created by Michael Borgmann on 10.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import SwiftUI
import RealmSwift

struct PostalCodeView: View {
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.query)

            List(viewModel.results, id: \.self) { result in
                Text("\(result.numCodPostal)-\(result.extCodPostal) \(result.desigPostal)")
            }.id(UUID()).gesture(DragGesture().onChanged { _ in
                UIApplication.shared.endEditing(true)
            })
            
        }
    }
}

struct PostalCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PostalCodeView()
    }
}
