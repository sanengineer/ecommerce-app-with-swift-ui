//
//  ButtonView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct ButtonView: View {
    
    var backgroundColor: Color = .heroColor
    var color: Color = .backgroundColorSchemeApp
    var label: String = "Button"
    var labelSize: CGFloat = 16
    var height: CGFloat = 60
    var isFixHeight: Bool = true
    var isHeightDefault: Bool = true
    var isOutlineStyle: Bool = false
    var cornerRadius: CGFloat = 10
    var borderWidth: CGFloat = 2
    var borderColor: Color = .heroColor
    
    var body: some View {
        
        GeometryReader{ proxy in
            Button(action: {
                print("Button Custom")
               
            }, label: {
                
               
                    Text(label)
//                        .font(Font.system(size: labelSize, weight: .bold, design: .default))
                        .font(.custom("CircularStd-Medium", size: labelSize))
                        .foregroundColor(isOutlineStyle == false ? color : .heroColor)
                        .frame(
                            width: proxy.size.width ,
                            height: proxy.size.height,
                            alignment: .center)
                        .background(isOutlineStyle == false ?  backgroundColor : .backgroundColorSchemeApp)
                        .cornerRadius(cornerRadius)
                        .if(isOutlineStyle == true, transform: { view in
                            view.overlay(
                                RoundedRectangle(cornerRadius: cornerRadius)
                                    .stroke(lineWidth: borderWidth)
                                    .foregroundColor(borderColor)
                            )
                        })
                        
               
                
            })
        
        }.if(isFixHeight == true, transform: { view in
            view.frame(height: height)
        })
        
       
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
