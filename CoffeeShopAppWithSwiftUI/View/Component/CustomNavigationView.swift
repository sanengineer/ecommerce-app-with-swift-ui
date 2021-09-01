//
//  CustomNavigationView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 31/08/21.
//

import Foundation
import SwiftUI

struct CustomNavigationView<Content: View, Destination:View>:View {
    
    let destination: Destination
    let content: Content
    let isRoot: Bool
    let isLast: Bool
    let color: Color
    let navTitle: String
    
    @SwiftUI.State var active = false
    @SwiftUI.Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, @ViewBuilder content: () -> Content, isRoot: Bool, isLast: Bool, color: Color, navTitle: String) {
        self.destination = destination
        self.content = content()
        self.isRoot = isRoot
        self.isLast = isLast
        self.color = color
        self.navTitle = navTitle
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                Color.white
                VStack{
                    ZStack{
                        HStack{
                            Image(systemName: "chevron.left")
                                .frame(width: 30)
                                .onTapGesture(count: 1, perform: {
                                        self.mode.wrappedValue.dismiss()
                                    })
                                .opacity(isRoot ? 0 : 1)
                                .background(Color.red)
                            Text(navTitle)
                                .font(Font.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(color)
                            Spacer()
//                            Image(systemName: "chevron.right")
//                                   .frame(width: 30)
//                                   .onTapGesture(count: 1, perform: {
//                                       self.active.toggle()
//                                   })
//                                .background(Color.red)
//                                .opacity(isLast ? 0 : 1)
                            NavigationLink(
                                destination: destination.navigationBarHidden(true)
                                    .navigationBarHidden(true),
                                isActive: self.$active,
                                label: {})
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 0)
                        .frame(width: geometry.size.width)
                    }
                    .frame(width: geometry.size.width, height: 80)
                    .ignoresSafeArea(.all)
                   
                }
                
                
               
                Spacer()
                    self.content
                    .padding()
                    .background(color.opacity(0.3))
                    .cornerRadius(20)
                Spacer()
                    
                
            }
        }
        .navigationBarHidden(true)
    }
}


//HStack{
//    ForEach(0..<tabCollection.count){ int in
//        VStack{
//            Image(tabCollection[int].tabIconDeactive)
//                .antialiased(true)
//                .resizable()
//                .frame(width: 24, height: 24, alignment: .center)
//        
//            Text(tabCollection[int].tabName)
//                .font(Font.system(size: 14, weight: .bold, design: .default))
//        }
//        
//    
//    }
//
//}
//
//HStack{
//    ForEach(0..<iconNames.count){ int in
//        VStack{
//            Image(iconNames[int])
//                .antialiased(true)
//                .resizable()
//                .frame(width: 24, height: 24, alignment: .center)
//        
//            Text("Hola")
//                .font(Font.system(size: 14, weight: .bold, design: .default))
//        }
//                        
//    if  iconNames[int] != iconNames[int].last {
//        Spacer()
//        }
//        
//    }
//
//}
//
//
//@SwiftUI.State var tabCollection = [
//    tabItem(tabIconDeactive: "icon_home_rounded_deactive", tabIconActive: "icon_home_rounded_active", tabName: "home"),
//    tabItem(tabIconDeactive: "icon_menu_rounded_deactive", tabIconActive: "icon_menu_rounded_active", tabName: "menu"),
//    tabItem(tabIconDeactive: "icon_cart_rounded_deactive", tabIconActive: "icon_cart_rounded_active", tabName: "cart"),
//    tabItem(tabIconDeactive: "icon_profile_rounded_deactive", tabIconActive: "icon_profile_rounded_active", tabName: "person")
//]
