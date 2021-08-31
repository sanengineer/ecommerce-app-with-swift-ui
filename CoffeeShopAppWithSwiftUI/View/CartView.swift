//
//  CartView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct CartView: View {
    var body: some View {
        VStack(spacing: 0){
          
            NavigationBar(navTitle:"Cart", backgroundColor: Color.heroColor)
                   
         
            VStack{
                ScrollView(showsIndicators: false){
                    VStack{
                        Text("halo")
                    }
                }
                .background(Color.red)
            }
        }
    }
}
