//
//  OrderView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing:0){
            NavigationBarMultilineView(navTitle:"Shipment",backgroundColor: .backgroundColorSchemeApp,color: .foregroundColorSchemeApp, iconName: "chevron.down", hiddenLeftBarButton: false, hiddenBorderBottom: false, hiddenRightBarButton: false, actionRightButton: {
                state.isExpandNavBar.toggle()
            }, state: state)
            
            ZStack{
                ShipmentView()
            }
            
            VStack(spacing: 0){
                HStack{
                    VTextSubtextView(textSize: 12, textWeight: .bold, subtextSize: 16, subtextWeight: .heavy, paddingActive: false)
                    Spacer()
                    NavLinkView(label: "Select Payment", isFixHeight: false, pathRouter: "/cart/order/pay")
                        .frame(width: 160, height: 50)
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, state.ratio == state.aspectScreen ? 20 : 40)
                
            }
            
            
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(state: State())
    }
}
