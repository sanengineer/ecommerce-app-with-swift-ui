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
    
    @StateObject var state = State()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.ignoresSafeArea(SafeAreaRegions.all, edges: .top)
            MenuView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Menu")
                }
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            ProfileView(state: State())
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
       
    }
    
  
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
