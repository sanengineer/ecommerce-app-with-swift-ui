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
    
    struct tabItem: Codable {
        var tabIconDeactive: String
        var tabIconActive: String
        var tabName: String
    }
    
    @SwiftUI.State private var selection = 0
    @SwiftUI.State var iconNames = ["icon_home_rounded_deactive", "icon_menu_rounded_deactive", "icon_cart_rounded_deactive", "icon_profile_rounded_deactive"]
    @SwiftUI.State var tabNames = ["home", "menu", "cart", "profile"]
    @SwiftUI.State var tabCollection = [
        tabItem(tabIconDeactive: "icon_home_rounded_deactive", tabIconActive: "icon_home_rounded_active", tabName: "home"),
        tabItem(tabIconDeactive: "icon_menu_rounded_deactive", tabIconActive: "icon_menu_rounded_active", tabName: "menu"),
        tabItem(tabIconDeactive: "icon_cart_rounded_deactive", tabIconActive: "icon_cart_rounded_active", tabName: "cart"),
        tabItem(tabIconDeactive: "icon_profile_rounded_active", tabIconActive: "icon_profile_rounded_active", tabName: "person")
    ]
    
    var body: some View {
        
       
        VStack{
            HStack{
                ForEach(0..<iconNames.count){ icon in
                    Button {
                       print("\(iconNames[icon])")
                    } label: {
                        VStack{
                            Image(iconNames[icon])
                                .antialiased(true)
                                .resizable()
                                .frame(width: 24, height: 24, alignment: .center)
                            Text("Home")
                                .font(Font.system(size: 14, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
                    }
                    if iconNames[icon] !=  iconNames.last {
                        Spacer()
                    }
                }
            }
            
            
            HStack{
                ForEach(0..<tabCollection.count){ int in
                    Button{
                        print("\(int != tabCollection.endIndex - 1)")
                    } label:{
                        VStack(alignment: .center){
                            Image(tabCollection[int].tabIconDeactive)
                                .antialiased(true)
                                .resizable()
                                .frame(width: 24, height: 24, alignment: .center)

                            Text(tabCollection[int].tabName)
                                .font(Font.system(size: 14, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
                        .background(Color.blue)
                    }
                    .frame(width: 60)
                    .background(Color.red)
                    
                    if int != tabCollection.endIndex - 1 {
                        Spacer()
                    }
                }
            }
            
            
            HStack{
                ForEach(0..<tabCollection.count){ int in
                    Button{
                        print("\(int != tabCollection.endIndex - 1)")
                    } label:{
                        VStack(alignment: .center){
                            Image(tabCollection[int].tabIconDeactive)
                                .antialiased(true)
                                .resizable()
                                .frame(width: 24, height: 24, alignment: .center)

                            Text(tabCollection[int].tabName)
                                .font(Font.system(size: 14, weight: .bold, design: .default))
                        }
                    }
                    .background(Color.red)
                  
                    if int != tabCollection.endIndex - 1 {
                        Spacer()
                    }


                }

            }
           
//
//            VStack(spacing:2) {
//
//            }
//            Spacer()
//            VStack(spacing:2) {
//                Image("icon_menu_rounded_deactive")
//                    .antialiased(true)
//                    .resizable()
//                    .frame(width: 24, height: 24, alignment: .center)
//
//                Text("Home")
//                    .font(Font.system(size: 14, weight: .bold, design: .default))
//            }
//            Spacer()
//            VStack(spacing:2) {
//                Image("icon_cart_rounded_deactive")
//                    .antialiased(true)
//                    .resizable()
//                    .frame(width: 24, height: 24, alignment: .center)
//
//                Text("Home")
//                    .font(Font.system(size: 14, weight: .bold, design: .default))
//            }
//            Spacer()
//            VStack(spacing:2) {
//                Image("icon_profile_rounded_deactive")
//                    .antialiased(true)
//                    .resizable()
//                    .frame(width: 24, height: 24, alignment: .center)
//
//                Text("Home")
//                    .font(Font.system(size: 14, weight: .bold, design: .default))
//            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 12)
        .padding(.bottom, 6)
        .background(Color.white)
        
        
        
        
//        ZStack{
//
//
//                HomeView()
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//                    .tag(1)
//                    .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
//
//                MenuView()
//                    .tabItem {
//                        Image(systemName: "book")
//                        Text("Menu")
//                    }
//                    .tag(2)
//                    .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
//                CartView()
//                    .tabItem {
//                        Image(systemName: "cart")
//                        Text("Cart")
//                    }
//                    .tag(3)
//                    .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
//                ProfileView(state: state)
//                    .tabItem {
//                        Image(systemName: "person.circle")
//                        Text("Profile")
//                    }
//                    .tag(4)
//                    .ignoresSafeArea(SafeAreaRegions.all, edges: .top)
//
//        }
        
        
       
    }
    
  
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
