//
//  ShipmentView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct ShipmentView: View {
    
    var textSize: CGFloat = 16
    var textSize14: CGFloat = 14
    
    var body: some View {
        
                ScrollView(showsIndicators: false){
                    VStack(spacing: 0){
                        VStack(alignment: .leading,spacing:20){
                            HStack(alignment: .center){
                                Text("Shipment Address")
//                                    .font(Font.system(size: 14, weight: .bold, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize14))
                                Spacer()
                                Button {
                                    print("shipment button")
                                } label: {
                                    Text("Change")
//                                        .font(Font.system(size: 14, weight: .bold, design: .default))
                                        .font(.custom("CircularStd-Bold", size: textSize14))
                                        .foregroundColor(.heroColor)
                                }

                            }
                            VStack(alignment: .leading,spacing:10){
                                Text("Home")
//                                    .font(Font.system(size: 14, weight: .bold, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize14))
                                Text("Address Detail")
//                                    .font(Font.system(size: textSize14, weight: .regular, design: .default))
                                    .font(.custom("CircularStd-Book", size: textSize14))
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
                            HNavLinkWithEmojiText(emoji:"🚛", title:"Shipment Platform",disableButton:false, enableCaption: false,isPaddingActive: false, action: {
                                print("shipment button")
                            })
                        }.padding(.horizontal,20)
                        .padding(.top, 20)
                        .padding(.bottom, 28)
                        .border(width: 8, edges: [.bottom], color: .borderBoldColorSchemeApp, opacity: 1.0)
                        
                        
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
//                                    .font(Font.system(size: 16, weight: .heavy, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize))
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

struct ShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentView()
    }
}
