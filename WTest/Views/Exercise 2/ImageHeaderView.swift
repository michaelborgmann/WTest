//
//  ImageHeaderView.swift
//  WTest
//
//  Created by Michael Borgmann on 10.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import SwiftUI

struct MyFrame : Equatable {
    let id : String
    let frame : CGRect
    
    static func == (lhs: MyFrame, rhs: MyFrame) -> Bool {
        lhs.id == rhs.id && lhs.frame == rhs.frame
    }
}

struct MyKey : PreferenceKey {
    typealias Value = [MyFrame] // The list of view frame changes in a View tree.
    
    static var defaultValue: [MyFrame] = []
    
    /// When traversing the view tree, Swift UI will use this function to collect all view frame changes.
    static func reduce(value: inout [MyFrame], nextValue: () -> [MyFrame]) {
        value.append(contentsOf: nextValue())
    }
}

struct ImageHeaderView: View {
    
    let items = Array(repeating: "", count: 50)
        .enumerated()
        .map { (index, _) in
            "\(index + 1). " + UUID().uuidString
    }
    
    @State var color = Color(.white)
    @State var offset: CGFloat = 0
    @State var yOrigin: CGFloat? = nil
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                
                List {
                    Section(header:
                        VStack {
                            HeaderView().frame(width: geometry.size.width)
                        }.frame(height: geometry.size.width / 2)
                    ) {
                        
                        Text("")
                            .transformAnchorPreference(key: MyKey.self, value: .bounds) {
                                $0.append(MyFrame(id: "tableTopCell", frame: geometry[$1]))
                        }
                        .onPreferenceChange(MyKey.self) { value in
                            
                            // NOTE: Oh, this is dirty, but SwiftUI doesn't support scroll offsets
                            let y = value.first!.frame.origin.y
                            
                            if self.yOrigin == nil && y != -1.0 {
                                self.yOrigin = y
                            }
                            
                            self.offset = y
                            
                            if let yOrigin = self.yOrigin {
                                
                                let change = 1.0 - (yOrigin - self.offset) / 200
                                self.color = Color.white.opacity(Double(change))
                            }
                        }
                        
                        ForEach(self.items, id: \.self) {
                            Text($0).lineLimit(1).truncationMode(.tail)
                        }
                    }
                }.edgesIgnoringSafeArea(.top)
                
                Rectangle()
                    .fill(self.color)
                    .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
                
            }
            
        }
    }
    
    private func calculateOffset(_ geometry: GeometryProxy) {
        Text("")
            .transformAnchorPreference(key: MyKey.self, value: .bounds) {
                $0.append(MyFrame(id: "tableTopCell", frame: geometry[$1]))
        }
        .onPreferenceChange(MyKey.self) { value in
            
            // NOTE: Oh, this is dirty, but SwiftUI doesn't support scroll offsets
            let y = value.first!.frame.origin.y
            
            if self.yOrigin == nil && y != 43{
                self.yOrigin = y
            }
            
            self.offset = y
            
            if let yOrigin = self.yOrigin {
                
                let change = 1.0 - (yOrigin - self.offset) / 200
                self.color = Color.green.opacity(Double(change))
            }
        }
    }
    
}

struct ImageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageHeaderView()
    }
}
