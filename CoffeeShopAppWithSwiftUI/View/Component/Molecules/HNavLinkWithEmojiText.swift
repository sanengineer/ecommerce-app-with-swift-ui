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
    var textSize20: CGFloat = 20
    var textSize16: CGFloat = 16
    var textSize: CGFloat = 14
    var captionSize: CGFloat = 14
    var action: () -> Void = {}
    var showEmoji: Bool = true
    
   
    
    var body: some View {
        HStack(spacing: 20){
            if showEmoji != false {
                VStack{
                    Text(emoji) .font(Font.system(size: textSize20))
                }
            }
            
            VStack(alignment: .leading){
                    Text(title)
                        .font(.custom("CircularStd-Bold", size: textSize))
                
                if enableCaption == true {
                    Text(caption)
                        .font(.custom("CircularStd-Book", size: captionSize))
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
