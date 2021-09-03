//
//  VCardImageLeftTextSubtextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI

struct VCardImageLeftTextSubtextView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 14){
                HStack(alignment: .top, spacing:0){
                    VStack{
                        Image("1")
                            .resizable()
                            .scaledToFill()
                           
                    }
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(10.0)
                    Spacer(minLength: 20)
                    VStack(alignment: .leading,spacing:20){
                        Text("Double Shot Shaken Double Shot Shaken")
                            .font(Font.system(size: 14, weight: .heavy, design: .default))
                            .lineLimit(2)
                        Text("Double Shot Shaken Double Shot Shaken Double Shot Shaken Double Shot Shaken")
                            .lineLimit(5)
                            .font(Font.system(size: 14, weight: .medium, design: .default))
                                                                
                    }
                    .padding(.trailing, 50)
                    
                    Spacer()
                }
                HStack{
                    Spacer()
                    VStack(alignment: .trailing, spacing: 3){
                        Text("Rp 300.000")
                            .font(Font.system(size: 12, weight: .heavy, design: .default))
                            .foregroundColor(.foregroundColorSchemeApp)
                        Text("per item")
                            .font(Font.system(size: 10, weight: .heavy, design: .default))
                            .foregroundColor(.foregroundColorSchemeApp).opacity(0.4)
                    }
                }
               
                HStack(alignment: .center,spacing: 0){
                    Text("Sub Total")
                        .font(Font.system(size: 14, weight: .bold, design: .default))
                        .foregroundColor(.foregroundColorSchemeApp)
                    Spacer()
                    VStack(alignment: .trailing){
                        HStack(spacing:0){
                            Text("Rp 900.000")
                                .font(Font.system(size: 14, weight: .heavy, design: .default))
                                .foregroundColor(.foregroundColorSchemeApp)
                            Spacer(minLength: 20)
                            Button(action: {
                                print("chevron down but item")
                            }, label: {
                                Image(systemName: "chevron.down")
                                    .font(Font.system(size: 14, weight: .medium, design: .default))
                                    .foregroundColor(.foregroundColorSchemeApp)
                            })
                        }
                    }
                    .frame(width: 130)
                }
            }
            .padding(.horizontal,20)
            .padding(.top, 20)
            .padding(.bottom, 28)
            .border(width: 8, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
        }
}

struct VCardImageLeftTextSubtextView_Previews: PreviewProvider {
    static var previews: some View {
        VCardImageLeftTextSubtextView()
    }
}
