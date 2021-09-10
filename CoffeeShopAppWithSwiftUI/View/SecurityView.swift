//
//  SecurityView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 07/09/21.
//

import SwiftUI

struct SecurityView: View {
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBar(navTitle: "Security", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false,hiddenBorderBottom: false, pathRouterLeftBar: "/profile")
            
            VStack(spacing:30){
                HNavLinkWithEmojiText(emoji: "📱", title: "Pin Screen App", pathName: "/profile/security/pin_screen",enableCaption: false ,isPaddingActive: false)
                
                HNavLinkWithEmojiText(emoji: "🔑", title: "Password Account", pathName: "/profile/security/password", enableCaption: false, isPaddingActive: false)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            
            
            Spacer()
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}


struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
    }
}
