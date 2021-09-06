//
//  CartView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct CartView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing: 0){
          
            NavigationBar(navTitle:"Cart", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, iconName: "heart", hiddenBorderBottom: false, hiddenRightBarButton: false)
                   
         
            VStack(spacing:0){
                ScrollView(showsIndicators: false){
                    VStack(spacing: 0) {
                        VStack(spacing: 0){
                            ForEach(0..<9){ item in
                                VStack(spacing:0){
                                    VCardImageTextSubTextButtonView(actionButtonDelete:{
                                        state.shohModalDelteItemOnCart.toggle()
                                    })
                                }.frame(height: 240)
                                Divider()
                            }
                        }
                    }
                }
            }
            
            VStack(spacing: 0){
                HStack{
                    VTextSubtextView(text: "Total Price",textSize: 12, subtext: "Rp 250.000", paddingActive: false, heroFontWeightText: "Book")
                    Spacer()
                    NavLinkView(label: "Buy", isFixHeight: false, pathRouter: "/cart/order")
                        .frame(width: 140, height: 50)
                        
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                
            }
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(state: State())
    }
}
