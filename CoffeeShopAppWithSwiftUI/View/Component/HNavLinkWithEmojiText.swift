//
//  HNavLinkWithEmojiText.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 31/08/21.
//

import Foundation
import SwiftUI

struct HNavLinkWithEmojiText<Content:View>: View {
    var emoji: String = "👋"
    var title: String = "Title"
    var caption: String = "Caption"
    var destinationView: Content
    
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
            NavigationLink(destination: destinationView){
                    Image(systemName: "chevron.right").font(.body).accentColor(.primary)
                }
           
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}
