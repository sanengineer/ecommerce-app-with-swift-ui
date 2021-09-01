//
//  VTextSubtextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct VTextSubtextView: View {
    var text: String = "Title"
    var textSize: CGFloat = 16
    var textWeight: Font.Weight = .bold
    var subtext: String = "Subtext subtext"
    var subtextSize: CGFloat = 16
    var subtextWeight: Font.Weight = .regular
    var hiddenButton: Bool = true
    var paddingActive: Bool = true
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6){
                Text(text)
                    .font(Font.system(size: textSize, weight: textWeight, design: .default))
                Text(subtext)
                    .font(Font.system(size: subtextSize, weight: subtextWeight, design: .default))
            }
            Spacer()
            
            if hiddenButton == false {
                Button(action: {
                    print("profile detail")
                }, label: {
                    Text("Edit")
                        .font(Font.system(size: 14, weight: .heavy, design: .default))
                        .foregroundColor(Color.darkLightColor)
                })
            }
            
        }
        .if(paddingActive == true, transform: { view in
            view
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
        })
       
       
        
    }
}

struct VTextSubtextView_Previews: PreviewProvider {
    static var previews: some View {
        VTextSubtextView()
    }
}
