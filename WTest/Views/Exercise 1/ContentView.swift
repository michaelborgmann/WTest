//
//  ContentView.swift
//  WTest
//
//  Created by Michael Borgmann on 10.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        TabView {
            
            PostalCodeView().tabItem {
                Image(systemName: "mappin.circle")
                Text("Zip")
            }
            
            ImageHeaderView().tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Header")
            }
            
            InputView().tabItem {
                Image(systemName: "pencil")
                Text("Input")
            }
            
            WebView().tabItem {
                Image(systemName: "safari")
                Text("Web")
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
