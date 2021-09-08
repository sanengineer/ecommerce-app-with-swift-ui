//
//  PinScreenView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 07/09/21.
//

import SwiftUI

struct PinScreenView: View {
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle: "Pin Screen", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false, pathRouterLeftBar: "/profile/security")
            
            VStack(spacing:0){
                
                HNavLinkWithEmojiText(title: "Create New Pin", pathName: "/profile/security/pin_screen/new_pin", enableCaption: false, isPaddingActive: false, showEmoji: false)
                
                
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}



struct PinScreen_Previews: PreviewProvider {
    static var previews: some View {
        PinScreenView()
    }
}
