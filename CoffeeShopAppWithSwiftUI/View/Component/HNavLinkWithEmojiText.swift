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
    var disableButton: Bool = true
    var enableCaption: Bool = true
    var isPaddingActive: Bool = true
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 20){
            VStack{
                Text(emoji) .font(Font.system(size: 30))
            }
            
            VStack(alignment: .leading){
                Text(title)
                    .font(Font.system(size: 18, weight: .medium, design: .default))
                if enableCaption == true {
                    Text(caption)
                        .font(Font.system(size: 14, weight: .light, design: .default))
                }
            }
            
            Spacer()
            if disableButton == true {
                NavLink(to: pathName) {
                    Image(systemName: "chevron.right").font(.body).accentColor(.primary)
                }
            } else {
                
            }
            
            
           if disableButton == false {
            Button(action: action) {
                Image(systemName: "ellipsis").font(.body).accentColor(.primary)
            }
            }
            
           
        }
        .if(isPaddingActive, transform: { view in
            view
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
        })
        
    }
}
