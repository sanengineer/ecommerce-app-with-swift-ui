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
                VStack(spacing: 50){
                    NavigationBar(navTitle: "Biodata", backgroundColor: .white, color: .black, titleSize: 26, hiddenLeftBarButton: false, hiddenBorderBottom: false)
                    
                    VStack(spacing:20){
                       
                        ForEach(0..<5){ int in
                            VTextSubtextView()
                        }
                    }
                }
                Spacer()
                
                
               
            }
            .background(Color.backgroundColorSchemeApp)
            .ignoresSafeArea(edges: .all)
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView()
    }
}
