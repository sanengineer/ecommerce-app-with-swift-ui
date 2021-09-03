//
//  ShippingDetailView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct ShippingDetailView: View {
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBar(navTitle: "Shipping Detail", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, iconName: "plus", hiddenLeftBarButton: false, hiddenBorderBottom: false, hiddenRightBarButton: false, pathRouterLeftBar: "/profile", pathRouterRightBar: "/profile/shipping/new_address")
          
           
                ScrollView(showsIndicators: false){
                    Spacer(minLength: 40)
                    VStack(alignment: .leading ,spacing: 32){
                        Text("Addresses")
                            .font(Font.system(size: 20, weight: .bold, design: .default))
                            .padding(.top, 10)
                            .foregroundColor(.foregroundColorSchemeApp)
                        
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address").frame(height: 240)
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address").frame(height: 240)
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address").frame(height: 240)
                    }.padding(.horizontal, 20)
                }.background(Color.backgroundColorSchemeApp)
        }.ignoresSafeArea(edges: .all)
    }
}

struct ShippingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailView()
    }
}
