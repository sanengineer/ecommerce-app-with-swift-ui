//
//  VCardImageTextSubTextButtonView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct VCardImageTextSubTextButtonView: View {
    
    var title: String = "Rp. 30.000"
    var subtitle: String = "Double Shoot Iced Shaken Espresso"
    var desc: String = "Espresso based with 80% milk and 20% espresso coffee"
    var textSize20: CGFloat = 20
    var textSize18: CGFloat = 18
    var textSize14: CGFloat = 14
    var textSize12: CGFloat = 12
 
    var body: some View {
        GeometryReader{ proxy in
            VStack(alignment: .center, spacing: 30){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10){
                        Text(title)
//                            .font(Font.system(size: textSize18, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize18))
                            .foregroundColor(.foregroundColorSchemeApp)
                        
                        Text(subtitle)
//                            .font(Font.system(size: textSize14, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize14))
                            .foregroundColor(.foregroundColorSchemeApp)
                            .lineLimit(3)
                        
                        Text(desc)
//                            .font(Font.system(size: textSize14, weight: .regular, design: .default))
                            .font(.custom("CircularStd-Book", size: textSize14))
                            .foregroundColor(.foregroundColorSchemeApp)
                            .lineLimit(3)
                    }
                    Spacer(minLength: 25)
                    VStack{
                        Image("1")
                            .resizable()
                            .scaledToFill()
                           
                    }
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(10.0)
                }
                
                
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "trash")
                            .font(Font.system(size: 24, weight: .medium, design: .default))
                            .foregroundColor(.foregroundColorSchemeApp)
                            .opacity(0.3)
                    })
                    Spacer()
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "minus.circle")
                                .font(Font.system(size: 24, weight: .medium, design: .default))
                                .foregroundColor(.foregroundColorSchemeApp)
                        })
                        Spacer(minLength: 2)
                        VStack{
                            Text("99")
//                                .font(Font.system(size: textSize18, weight: .bold, design: .default))
                                .font(.custom("CircularStd-Bold", size: textSize18))
                                .foregroundColor(.foregroundColorSchemeApp)
                                .padding(.bottom, 6)
                        }
                        .frame(width: 30)
                        .border(width: 3, edges: [.bottom], color: .darkLightColor, opacity: 0.5)
                        
                        Spacer(minLength: 2)
                        Button(action: {}, label: {
                            Image(systemName: "plus.circle")
                                .font(Font.system(size: 24, weight: .medium, design: .default))
                                .foregroundColor(.foregroundColorSchemeApp)
                        })
                    }.frame(width: 100, height: 40, alignment: .center)
                }
            }
            .padding(.horizontal, 20)
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            .background(Color.backgroundColorSchemeApp)
          
        }
    }
}

struct VCardImageTextSubTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VCardImageTextSubTextButtonView()
    }
}
