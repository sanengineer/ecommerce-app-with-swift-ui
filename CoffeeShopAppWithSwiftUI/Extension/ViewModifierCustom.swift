//
//  ViewModifierCustom.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter
import Combine
import UIKit

struct NavigationTransition: ViewModifier {
    @EnvironmentObject private var navigator: Navigator
    
    func body(content: Content) -> some View {
        content
            .animation(.easeInOut)
            .transition(
                navigator.lastAction?.direction == .deeper || navigator.lastAction?.direction == .sideways
                    ? AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                    : AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
            )
    }
}


struct NavigationTransitionOpacity: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .animation(.none)
    }
}

struct KeyboardAdaptive: ViewModifier {
    @StateObject private var state : State
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .padding(.top, self.state.bottomPaddingKeyboard)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.minY ?? 0
                    
                    self.state.bottomPaddingKeyboard = min(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.top)
                }
                .animation(.easeOut(duration: 0.16))
        }
    }
}
