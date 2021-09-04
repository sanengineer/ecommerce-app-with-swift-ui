//
//  PickupView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI

struct PickupView: View {
    
    var textSize14: CGFloat = 14
    var textSize16: CGFloat = 16
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 0){
                VStack(alignment: .leading,spacing:20){
                    HStack(alignment: .center){
                        Text("Store Address")
//                            .font(Font.system(size: textSize14, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize14))
                        Spacer()
                        Button {
                            print("pickup button")
                        } label: {
                            Text("Change")
//                                .font(Font.system(size: textSize14, weight: .bold, design: .default))
                                .font(.custom("CircularStd-Bold", size: textSize14))
                                .foregroundColor(.heroColor)
                        }

                    }
                    VStack(alignment: .leading,spacing:10){
                        Text("Head Quarter")
//                            .font(Font.system(size: textSize14, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize14))
                        Text("Address Detail")
//                            .font(Font.system(size: textSize14, weight: .regular, design: .default))
                            .font(.custom("CircularStd-Medium", size: textSize14))
                            .lineLimit(3)
                    }
                }
                .padding(.horizontal,20)
                .padding(.top, 20)
                .padding(.bottom, 28)
                .border(width: 8, edges: [.bottom], color: .borderBoldColorSchemeApp, opacity: 1.0)
               
                ForEach(0..<3){ _ in
                    VCardImageLeftTextSubtextView()
                }
                
                
                VStack{
                    HNavLinkWithEmojiText(emoji: "✂️", title: "Use Coupon", enableCaption: false, isPaddingActive: false,action: {})
                }
                .padding(.horizontal,20)
                .padding(.top, 20)
                .padding(.bottom, 28)
                .border(width: 8, edges: [.bottom], color: .borderBoldColorSchemeApp, opacity: 1.0)
                
                
                VStack(spacing: 0){
                    HStack(alignment: .bottom){
                        VTextSubtextView(textSize: 14, subtextSize: 12, paddingActive: false, heroFontWeightSubtext: "Book")
                        Spacer()
                        Text("Rp 3.000.000")
//                            .font(Font.system(size: 16, weight: .heavy, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize16))
                            .lineLimit(3)
                            
                    }
                }.padding(.horizontal,20)
                .padding(.top, 20)
                .padding(.bottom, 28)
                .border(width: 8, edges: [.bottom], color: .borderBoldColorSchemeApp, opacity: 1.0)
               
                
            }
        }
    }
}

struct PickupView_Previews: PreviewProvider {
    static var previews: some View {
        PickupView()
    }
}
