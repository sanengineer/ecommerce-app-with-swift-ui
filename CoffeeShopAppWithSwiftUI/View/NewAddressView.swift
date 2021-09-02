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
    
    var body: some View {
        VStack(spacing: 0){
            NavigationBar(navTitle: "", backgroundColor: .red, color: .black, hiddenLeftBarButton: false, pathRouter: "/profile/shipping")
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 50){
                    
                    Text("New Address")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
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
            .background(Color.white)
        }.ignoresSafeArea(edges: .all)
    }
}

struct NewAddressView_Previews: PreviewProvider {
    static var previews: some View {
        NewAddressView(state: State())
    }
}
