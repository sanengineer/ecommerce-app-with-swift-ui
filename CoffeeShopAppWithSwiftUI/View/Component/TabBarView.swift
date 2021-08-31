//
//  TabBarView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct TabBarView: View {
 
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var state = State()
    @SwiftUI.State private var selection = 0
    
    var handler: Binding<Int> { Binding(
    
        get: {self.selection},
        set: {
            if $0 == self.selection {
                print("Reset")
            }
            
            self.selection = $0
        }
    
    )}
    
    var body: some View {
        TabView(selection: handler){
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
                .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
                
            MenuView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Menu")
                }
                .tag(1)
                .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(2)
                .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
            ProfileView(state: state)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(3)
                .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
        }
        
       
    }
    
  
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
