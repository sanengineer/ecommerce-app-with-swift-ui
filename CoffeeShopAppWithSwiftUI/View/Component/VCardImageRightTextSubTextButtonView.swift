//
//  VCardImageTextSubTextButtonView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct VCardImageTextSubTextButtonView: View {
    
    var title: String = "Title"
    var subtitle: String = "Subtitle Subtitle Subtitle Subtitle Subtitle"
    var desc: String = "Description Description Description Description Description Description Description Description Description Description Description Description Description Description"
 
    var body: some View {
        GeometryReader{ proxy in
            VStack(alignment: .center, spacing: 30){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10){
                        Text(title)
                            .font(Font.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.foregroundColorSchemeApp)
                        
                        Text(subtitle)
                            .font(Font.system(size: 14, weight: .bold, design: .default))
                            .foregroundColor(.foregroundColorSchemeApp)
                            .lineLimit(3)
                        
                        Text(desc)
                            .font(Font.system(size: 14, weight: .regular, design: .default))
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
                                .font(Font.system(size: 20, weight: .bold, design: .default))
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
