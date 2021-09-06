//
//  ShippingDetailView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct ShippingDetailView: View {
    
    @StateObject var state: State
    var textSize20: CGFloat = 20
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBar(navTitle: "Shipping Detail", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, iconName: "plus", hiddenLeftBarButton: false, hiddenBorderBottom: false, hiddenRightBarButton: false, pathRouterLeftBar: "/profile", pathRouterRightBar: "/profile/shipping/new_address")
          
           
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading ,spacing: 32){
                        Text("Addresses")
                            .font(.custom("CircularStd-Bold", size: textSize20))
                            .padding(.top, 10)
                            .foregroundColor(.foregroundColorSchemeApp)
                    
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address").frame(height: 200)
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address").frame(height: 200)
                        VCardTextButton(pathRouter:"/profile/shipping/edit_address", actionSetDefaultAddress: {
                            state.showModalSetDefaultAddress.toggle()
                        }).frame(height: 200)
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }.background(Color.backgroundColorSchemeApp)
        }.ignoresSafeArea(edges: .all)
    }
}

struct ShippingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailView(state: State())
    }
}
