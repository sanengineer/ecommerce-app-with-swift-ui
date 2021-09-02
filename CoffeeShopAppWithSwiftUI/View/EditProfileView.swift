//
//  EditNameView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        VStack(spacing: 40){
            NavigationBar(navTitle: "Edit Profile", backgroundColor: .white, color: .black, titleSize: 26, hiddenLeftBarButton: false, hiddenBorderBottom: false)
            
            VStack(spacing: 40){
                VTextSubtextView(text: "Fullname", textWeight: .medium, subtext: "San Engineeer", subtextSize: 24, subtextWeight: .bold, hiddenButton: true, paddingActive: false)
                    .padding(.bottom, 14)
                    .border(width: 3, edges: [.bottom], color: .heroColor, opacity: 1.0)
                ButtonView(label: "Save")
            }
            
            .frame(width: UIScreen.screenWidth - 40, alignment: .center)
           
            Spacer()
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
