//
//  MenuView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter

struct MenuView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing: 0){
           
            NavigationBar(navTitle:"Menu", backgroundColor: Color.heroColor)
            NavLink(to: self.state.profile_detail_path) {
                Text("\(self.state.profile_detail_path)")
            }
          
            VStack{
                ScrollView(showsIndicators: false){
                  
                            
                       
                }
                
                .background(Color.red)
            }
           
        }
    }
}
