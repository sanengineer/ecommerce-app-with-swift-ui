//
//  ButtonView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct ButtonView: View {
    
    var backgroundColor: Color = .heroColor
    var color: Color = .white
    var label: String = "Button"
    var labelSize: CGFloat = 16
    var height: CGFloat = 60
    var isHeightDefault: Bool = true
    var isOutlineStyle: Bool = false
    
    var body: some View {
        
        GeometryReader{ proxy in
            Button(action: {
                print("Button Custom")
            }, label: {
                
               
                    Text(label)
                        .font(Font.system(size: labelSize, weight: .bold, design: .default))
                        .foregroundColor(isOutlineStyle == false ? color : .heroColor)
                        .frame(
                            width: proxy.size.width ,
                            height: proxy.size.height,
                            alignment: .center)
                        .background(isOutlineStyle == false ?  backgroundColor : .white)
                        .cornerRadius(10.0)
                        .if(isOutlineStyle == true, transform: { view in
                            view.overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.heroColor)
                            )
                        })
                        
               
                
            })
        
        }.frame(height: height)
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
