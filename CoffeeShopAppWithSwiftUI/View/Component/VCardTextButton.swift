//
//  VCardTextButton.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct VCardTextButton: View {
    var title: String = "Title"
    var desc: String = "Description description description description description description description description description description description description description "
    var isDefault: Bool = true
    var color: Color = .black
    var height: CGFloat = 250
    var body: some View {
        GeometryReader{ proxy in
           
            VStack{
                VStack(alignment: .leading, spacing: 20){
                    HStack(spacing: 0){
                        HStack(spacing: 10){
                            Text(title)
                                .font(Font.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(color)
                            if isDefault == true {
                                    Text("default")
                                        .font(Font.system(size: 8, weight: .bold, design: .default))
                                        .foregroundColor(.heroColor)
                                        .padding(.horizontal, 5)
                                        .padding(.vertical, 4)
                                        .background(Color.heroColor100)
                                        .cornerRadius(4.0)
                            }
                        }
                        Spacer()
                        Button(action: {
                            print("Button Modal Address")
                        }, label: {
                            Image(systemName: "ellipsis")
                                .font(Font.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(color)
                        })
                    }
                    
                    VStack(alignment:.leading){
                        Text(desc)
                            .font(Font.system(size: 14, weight: .medium, design: .default))
                    }.lineLimit(6)
                    .frame(width: UIScreen.screenWidth - (UIScreen.screenWidth/4), alignment: .leading)
                
                    ButtonView(labelSize:14, height:55)
                }
                .padding(.horizontal, 20)
                
                
            }
               
            
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            .background(Color.white)
            .cornerRadius(14, antialiased: true)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .strokeBorder(lineWidth: 1, antialiased: true)
                    .foregroundColor(.gray).opacity(0.5)
            )
            
           
        }
       
    }
}

struct VCardTextButton_Previews: PreviewProvider {
    static var previews: some View {
        VCardTextButton()
    }
}
