//
//  NewAddressView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI
import SwiftUIRouter

struct NewAddressView: View {
    
    @StateObject var state: State
    
    var textSize20: CGFloat = 20
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBar(navTitle: "", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, pathRouterLeftBar: "/profile/shipping")
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 50){
                    
                    Text("New Address")
                        .font(.custom("CircularStd-Bold", size: textSize20))
                        .foregroundColor(.heroColor)
                        .padding(.top, 30)
                       
                    VStack(spacing: 50){
                        ForEach(0..<5){ _ in
                            VTextSubtextInputView(state: state)
                        }
                        Spacer()
                        ButtonView(label:"Save", height: 50, isOutlineStyle: true)
                    }
                }
                .padding(.horizontal, 20)
            }
            .background(Color.backgroundColorSchemeApp)
        }.ignoresSafeArea(edges: .all)
    }
}

struct NewAddressView_Previews: PreviewProvider {
    static var previews: some View {
        NewAddressView(state: State())
    }
}
