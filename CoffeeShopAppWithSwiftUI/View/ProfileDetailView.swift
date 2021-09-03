//
//  ProfileDetailView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI
import SwiftUIRouter

struct ProfileDetailView: View {
    var body: some View {
            VStack(spacing: 0){
                    NavigationBar(navTitle: "Biodata", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false)
                    
                    VStack(spacing:0){
                        ScrollView(showsIndicators: false){
                            Spacer(minLength: 40)
                            
                            VStack(spacing: 20){
                                ForEach(0..<5){ int in
                                    VTextSubtextView(hiddenButton:false, pathRouter: "/profile/biodata/edit")
                                }
                            }
                        }
                       
                    }
            }
            .background(Color.backgroundColorSchemeApp)
            .ignoresSafeArea(.all)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
