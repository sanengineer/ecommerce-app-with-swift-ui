//
//  PinScreenView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 07/09/21.
//

import SwiftUI

struct PinScreenView: View {
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle: "Pin Screen", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false, pathRouterLeftBar: "/profile/security")
            
            VStack(spacing:20){
                
                HNavLinkWithEmojiText(title: "Create New Pin", pathName: "/profile/security/pin_screen/new_pin", enableCaption: false, isPaddingActive: false, showEmoji: false)
                
                VStack(alignment: .leading, spacing:10){
                        Text("Activate Pin")
                            .font(Font.custom("CircularStd-Bold", size: 14))
                        Toggle(isOn: $state.activatePinScreen) {
                            HStack(spacing:8){
                                Image(systemName: self.state.activatePinScreen ?  "iphone" : "iphone.slash" )
                                    .font(Font.system(size: 20, weight: .medium, design: .default))
                                Text("\(self.state.activatePinScreen ? "On" : "Off")")
                                    .font(Font.custom("CircularStd-Bold", size: 16))
                            }
                            .foregroundColor(self.state.activatePinScreen ? .green : .foregroundColorSchemeApp)
                        }
                        .onAppear{
                            let valueBool = state.getActivatePin()
                            print(valueBool)
                            state.activatePinScreen = valueBool
                        }
                        .onChange(of: state.activatePinScreen) { _ in
                            state.setActivatePin()
                        }
                   
                    }
                
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
        PinScreenView(state: State())
    }
}
