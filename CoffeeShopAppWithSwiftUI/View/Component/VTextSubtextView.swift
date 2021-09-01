//
//  VTextSubtextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct VTextSubtextView: View {
    var text: String = "Title"
    var subtext: String = "Subtext subtext"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6){
                Text(text)
                    .font(Font.system(size: 16, weight: .heavy, design: .default))
                Text(subtext)
                    .font(Font.system(size: 16, weight: .regular, design: .default))
            }
            Spacer()
            Button(action: {
                print("profile detail")
            }, label: {
                Text("Edit")
                    .font(Font.system(size: 14, weight: .heavy, design: .default))
                    .foregroundColor(Color.darkLightColor)
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        
    }
}

struct VTextSubtextView_Previews: PreviewProvider {
    static var previews: some View {
        VTextSubtextView()
    }
}
