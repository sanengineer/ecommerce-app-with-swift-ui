//
//  PublishersExtention.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 05/09/21.
//

import Foundation
import Combine
import SwiftUI
import UIKit

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification).map{ $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification).map{ _ in CGFloat(0)}
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
