//
//  ObservableObject.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import Foundation
import SwiftUI

class State: ObservableObject {
    @Published var iconName: String = "moon"
    @Published var labelThemeColor: String = "Dark"
    @Published var colorScheme = ColorScheme.dark
    @Published var bool: Bool = false
}
