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
    var hPadding: CGFloat = 0
    
    var body: some View {
            Button(action: {
                print("Button Custom")
            }, label: {
                
                GeometryReader{ proxy in
                    Text(label)
                        .font(Font.system(size: labelSize, weight: .bold, design: .default))
                        .foregroundColor(color)
                        .frame(
                            width: proxy.size.width ,
                            height: 60,
                            alignment: .center)
                        .background(backgroundColor)
                        .cornerRadius(10.0)
                }
                
            })
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
