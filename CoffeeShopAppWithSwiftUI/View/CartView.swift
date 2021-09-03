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
          
            NavigationBar(navTitle:"Cart", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, iconName: "heart", hiddenBorderBottom: false, hiddenRightBarButton: false)
                   
         
            VStack(spacing:0){
                ScrollView(showsIndicators: false){
                    VStack(spacing: 0) {
                        VStack(spacing: 0){
                            ForEach(0..<9){ item in
                                VStack(spacing:0){
                                    VCardImageTextSubTextButtonView()
                                }.frame(height: 240)
                                Divider()
                            }
                        }
                    }
                }
            }
            
            VStack(spacing: 0){
                HStack{
                    VTextSubtextView(paddingActive: false)
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
        CartView()
    }
}
