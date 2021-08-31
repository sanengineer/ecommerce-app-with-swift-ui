//
//  MenuView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(spacing: 0){
           
            NavigationBar(navTitle:"Menu", backgroundColor: Color.heroColor)
                 
          
            VStack{
                ScrollView(showsIndicators: false){
                    VStack{
                    
                       
                    }
                   
                }
                
                .background(Color.red)
            }
           
        }
    }
}
