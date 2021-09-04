//
//  CardImageTextButtonView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI
import SwiftUIRouter

struct CardImageTextButtonView: View {
    
    var pathRouter: String = "home"
    
    var body: some View {
        VStack(spacing: 20){
            NavLink(to: pathRouter) {
            VStack(alignment: .center,spacing:10){
                VStack{
                    Image("1")
                        .resizable()
                        .scaledToFill()
                }
                .frame(minWidth: 100, maxWidth: .infinity ,minHeight:90, maxHeight: 100)
                .background(Color.foregroundColorSchemeApp)
                        
                HStack(){
                    VStack(alignment: .leading, spacing: 10){
                        Text("Coffee Double Shot Double Shot Double Shot - 250ml Coffee Double Shot Double Shot Double Shot - 250ml")
        //                    .font(Font.system(size: 14, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Book", size: 14))
                            .lineLimit(4)
                        Text("Rp 20.000")
        //                    .font(Font.system(size: 14, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Medium", size: 14))
                        }
                    .layoutPriority(100)
                    Spacer()
                }.padding()
            }
            .cornerRadius(10, antialiased: true)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 1, antialiased: true)
                    .foregroundColor(.borderColorSchemeApp)
            )
            }
            .foregroundColor(.foregroundColorSchemeApp)
            
          
            ButtonView(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, label: "Add", labelSize: 14,height: 30, isFixHeight: true,isOutlineStyle: true, cornerRadius: 10, borderWidth: 1, borderColor: .borderColorSchemeApp)
          
        }
       
    }
}

struct CardImageTextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CardImageTextButtonView()
    }
}
