//
//  InputViewModel.swift
//  WTest
//
//  Created by Michael Borgmann on 12.03.20.
//  Copyright © 2020 Michael Borgmann. All rights reserved.
//

import Foundation

class InputViewModel: ObservableObject {
    @Published var items = Array(repeating: "", count: 50)
}
