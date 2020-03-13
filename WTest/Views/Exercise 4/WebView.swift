//
//  WebView.swift
//  WTest
//
//  Created by Michael Borgmann on 13.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import SwiftUI

struct WebView: View {
    
    @ObservedObject var model = WebViewModel(link: "https://www.apple.com")
    
    var body: some View {
        NavigationView {
            SwiftUIWebView(viewModel: model)
            
            if model.didFinishLoading {
                // ... code here
            }
        }

    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}

/*
struct AnyView: View {
    @ObservedObject var model = WebViewModel(link: "https://www.wikipedia.org/")


var body: some View {


        NavigationView {
       SwiftUIWebView(viewModel: model)
                if model.didFinishLoading {
                    //do your stuff
                }
   }
   }
*/
