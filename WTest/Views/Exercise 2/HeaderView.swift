//
//  HeaderView.swift
//  WTest
//
//  Created by Michael Borgmann on 12.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct HeaderView: View {
    
    private let url = URL(string: "https://github.com/onevcat/Kingfisher/blob/master/images/kingfisher-1.jpg?raw=true")
    
    var body: some View {
        GeometryReader { geometry in
            KFImage(self.url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.width / 2)
                .clipped()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
