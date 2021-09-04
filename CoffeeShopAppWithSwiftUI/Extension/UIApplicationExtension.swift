//
//  UIApplicationExtension.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 05/09/21.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
