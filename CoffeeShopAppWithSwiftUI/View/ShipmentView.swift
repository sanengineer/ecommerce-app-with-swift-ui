//
//  ShipmentView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct ShipmentView: View {
    
    var body: some View {
        
                ScrollView(showsIndicators: false){
                    VStack(spacing: 0){
                        VStack(alignment: .leading,spacing:20){
                            HStack(alignment: .center){
                                Text("Shipment Address")
                                    .font(Font.system(size: 14, weight: .bold, design: .default))
                                Spacer()
                                Button {
                                    print("shipment button")
                                } label: {
                                    Text("Change")
                                        .font(Font.system(size: 14, weight: .bold, design: .default))
                                        .foregroundColor(.heroColor)
                                }

                            }
                            VStack(alignment: .leading,spacing:10){
                                Text("Home")
                                    .font(Font.system(size: 14, weight: .bold, design: .default))
                                Text("Address Detail")
                                    .font(Font.system(size: 14, weight: .regular, design: .default))
                                    .lineLimit(3)
                            }
                        }
                        .padding(.horizontal,20)
                        .padding(.top, 20)
                        .padding(.bottom, 28)
                        .border(width: 8, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
                       
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
                        .border(width: 8, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
                        
                        
                        VStack{
                            HNavLinkWithEmojiText(emoji: "✂️", title: "Use Coupon", enableCaption: false, isPaddingActive: false,action: {})
                        }
                        .padding(.horizontal,20)
                        .padding(.top, 20)
                        .padding(.bottom, 28)
                        .border(width: 8, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
                        
                        
                        VStack(spacing: 0){
                            HStack(alignment: .bottom){
                                VTextSubtextView(textSize: 16, textWeight: .heavy, subtextSize: 14, subtextWeight: .bold, paddingActive: false)
                                Spacer()
                                Text("Rp 3.000.000")
                                    .font(Font.system(size: 16, weight: .heavy, design: .default))
                                    .lineLimit(3)
                                    
                            }
                        }.padding(.horizontal,20)
                        .padding(.top, 20)
                        .padding(.bottom, 28)
                        .border(width: 8, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
                       
                        
                    }
                }
        
    }
}

struct ShipmentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipmentView()
    }
}
