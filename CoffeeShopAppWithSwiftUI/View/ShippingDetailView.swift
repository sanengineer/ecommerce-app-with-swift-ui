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
            NavigationBar(navTitle: "Shipping Detail", backgroundColor: .white, color: .black, titleSize: 26, hiddenLeftBarButton: false, hiddenBorderBottom: false)
          
           
                ScrollView(showsIndicators: false){
                    Spacer(minLength: 40)
                    VStack(alignment: .leading ,spacing: 32){
                        Text("Addresses")
                            .font(Font.system(size: 20, weight: .bold, design: .default))
                            .padding(.top, 10)
                        
                        VCardTextButton().frame(height: 240)
                        VCardTextButton().frame(height: 240)
                        VCardTextButton().frame(height: 240)
                    }.padding(.horizontal, 20)
                }
        }
    }
}

struct ShippingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingDetailView()
    }
}
