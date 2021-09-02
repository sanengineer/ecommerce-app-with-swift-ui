//
//  ViewExtension.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 31/08/21.
//

import Foundation
import SwiftUI

extension View {
    func navigateTo<NewView: View>(to view:NewView, when binding: Binding<Bool>) -> some View {
        ZStack{
        NavigationView{
            VStack{
               
                    self
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    
                    NavigationLink(
                        destination:view.navigationBarTitle("").navigationBarHidden(true), isActive: binding
                    ){
                        EmptyView()
                    }
                }
            }
            
        }
    }
    
    func border(width: CGFloat, edges: [Edge], color: Color, opacity: Double ) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color).opacity(opacity))
    }
    
    func navigationTransition() -> some View {
            modifier(NavigationTransition())
        }
    
    func navigationTransitionOpaticy() -> some View {
            modifier(NavigationTransitionOpacity())
    }
    
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

