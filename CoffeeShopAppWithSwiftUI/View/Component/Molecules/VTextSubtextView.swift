//
//  VTextSubtextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI
import SwiftUIRouter

struct VTextSubtextView: View {
    var text: String = "Title"
    var textSize: CGFloat = 14
    var textWeight: Font.Weight = .bold
    var subtext: String = "Subtext subtext"
    var subtextSize: CGFloat = 16
    var subtextWeight: Font.Weight = .regular
    var hiddenButton: Bool = true
    var paddingActive: Bool = true
    var pathRouter: String = "home"
    var textButtonSize: CGFloat = 14
    var isHeroFontActive: Bool = true
    var heroFontWeightText: String = "Bold"
    var heroFontWeightSubtext: String = "Bold"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6){
                Text(text)
//                    .font(Font.system(size: textSize, weight: textWeight, design: .default))
                    .font(.custom("CircularStd-\(heroFontWeightText)", size: textSize))
                Text(subtext)
//                    .font(Font.system(size: subtextSize, weight: subtextWeight, design: .default))
                    .font(.custom("CircularStd-\(heroFontWeightSubtext)", size: subtextSize))
            }
            Spacer()
            
            if hiddenButton == false {
                NavLink(to: pathRouter ){
                    Text("Edit")
//                        .font(Font.system(size: textSize14, weight: .heavy, design: .default))
                        .font(.custom("CircularStd-Medium", size: textButtonSize))
                        .foregroundColor(Color.darkLightColor)
                }
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
