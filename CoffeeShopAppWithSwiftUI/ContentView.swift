//
//  ContentView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import SwiftUI
import SwiftUIRouter

struct ContentView: View {
    
    var body: some View {
  
        Router {
            ZStack{
                MainView(state: State())
                
                Route(path: "/menu/profile_detail"){
                    NewAddressView(state: State())
                        
                }.navigationTransitionOpaticy()
                
                Route(path: "/profile/biodata") {
                    ProfileDetailView()
                }
                
                
                
                Route(path: "/profile/shipping") {
                    ShippingDetailView()
                }.navigationTransitionOpaticy()
                
                Route(path: "/profile/settings") {
                    SettingsView(state: State())
                }
            }
            
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
