//
//  HNavLinkWithEmojiText.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 31/08/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter

struct HNavLinkWithEmojiText: View {
    var emoji: String = "👋"
    var title: String = "Title"
    var caption: String = "Caption"
    var pathName: String = "home"
    
    var body: some View {
        HStack(spacing: 20){
            VStack{
                Text(emoji) .font(Font.system(size: 30))
            }
            
            VStack(alignment: .leading){
                Text(title)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                Text(caption)
                    .font(Font.system(size: 14, weight: .light, design: .default))
            }
            
            Spacer()
            NavLink(to: pathName) {
                Image(systemName: "chevron.right").font(.body).accentColor(.primary)
            }
           
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}
