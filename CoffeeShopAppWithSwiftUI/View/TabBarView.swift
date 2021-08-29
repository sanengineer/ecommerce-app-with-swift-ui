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
    
    var body: some View {
        TabView{
            HomeView()
                .foregroundColor(.blue)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Menu")
                .tabItem {
                    Image(systemName: "book")
                    Text("Menu")
                }
            Text("Cart")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .colorScheme(ColorScheme.dark)
    }
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
