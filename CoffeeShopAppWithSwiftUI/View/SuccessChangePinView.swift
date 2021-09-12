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
    @Binding var isDarkScheme: Bool
    
    var body: some View {
        ZStack(alignment: .center){
            
           
            
            if isVerified {
                Color.backgroundColorSchemeApp
                VStack(spacing: 0) {
                    VStack(alignment: .leading,spacing:0){
//                        NavLink(to: "/profile/security") {
//                            Image(systemName: "xmark")
//                                .font(Font.system(size: 24, weight: .medium))
//                        }
                       
                        Button(action: {
                            isVerified.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(Font.system(size: 24, weight: .medium))
                        })
                    }
                    
                    VStack(alignment: .center,spacing:30){
                        Text(isDarkScheme ? "👏🏻" : "👏🏿")
                            .font(Font.system(size: UIScreen.screenHeight / 4.5))
                        Text("Success Change New Pin")
                            .font(Font.custom("CircularStd-Bold", size: 24))
                    }
                }
                .background(Color.red)
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
               
                .transition(AnyTransition.scale(scale: 0, anchor: .center))
                .ignoresSafeArea(.all)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .center)
        .animation(.easeInOut(duration: 0.2))
        .ignoresSafeArea(.all)
    }
}

struct SuccessChangePinView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessChangePinView(isVerified: .constant(true), isDarkScheme: .constant(true))
    }
}
