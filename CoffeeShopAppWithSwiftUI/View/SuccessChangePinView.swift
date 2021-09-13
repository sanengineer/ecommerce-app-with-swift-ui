//
//  SuccessChangePinView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 12/09/21.
//

import SwiftUI
import SwiftUIRouter

struct SuccessChangePinView: View {
    
    @Binding var isVerified: Bool
    var isDarkScheme = true
    
    var body: some View {
        if isVerified {
            VStack(spacing: 0){
                
                NavigationBar(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, iconLeftName: "xmark", hiddenLeftBarButton: false, pathRouterLeftBar: "/profile/security", showTitle: false)
                
                mainContent
                    .offset(x: 0, y: -80)
               
            }
            .animation(.easeInOut(duration: 0.2))
            .background(Color.backgroundColorSchemeApp)
            .ignoresSafeArea(.all)
        }
    }
    
    var mainContent: some View {
        VStack(spacing: 0) {
            Spacer()
            VStack(alignment: .center,spacing:30){
                Text(isDarkScheme ? "👏🏻" : "👏🏿")
                    .font(Font.system(size: UIScreen.screenHeight / 5))
                Text("Success Change New Pin")
                    .font(Font.custom("CircularStd-Bold", size: 24))
            }
            Spacer()
        }
        .transition(AnyTransition.scale(scale: 0, anchor: .center))
    }
}

struct SuccessChangePinView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessChangePinView(isVerified: .constant(true))
    }
}
