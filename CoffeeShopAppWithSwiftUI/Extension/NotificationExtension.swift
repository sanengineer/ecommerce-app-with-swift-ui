//
//  NotificationExtension.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 05/09/21.
//

import Foundation
import SwiftUI
import UIKit

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
