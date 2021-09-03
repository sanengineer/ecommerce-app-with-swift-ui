//
//  EditAddressView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI
import SwiftUIRouter

struct EditAddressView: View {
    
    @StateObject var state: State
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle: "", backgroundColor: .backgroundColorSchemeApp  , color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, pathRouterLeftBar: "/profile/shipping")
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 50){
                    Text("Edit Address")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.foregroundColorSchemeApp)
                    VStack(spacing: 50){
                        ForEach(0..<5){ _ in
                            VTextSubtextInputView(state: state, hideLabelTextField: false)
                        }
                        Spacer()
                        ButtonView(label:"Save",height: 50, isOutlineStyle: true)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}

struct EditAddressView_Previews: PreviewProvider {
    static var previews: some View {
        EditAddressView(state: State())
    }
}
