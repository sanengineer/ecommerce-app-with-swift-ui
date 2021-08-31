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
