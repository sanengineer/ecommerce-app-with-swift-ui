//
//  NavLinkView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI
import SwiftUIRouter

struct NavLinkView: View {
    var backgroundColor: Color = .heroColor
    var color: Color = .white
    var label: String = "Button"
    var labelSize: CGFloat = 16
    var height: CGFloat = 60
    var isFixHeight: Bool = true
    var isHeightDefault: Bool = true
    var isOutlineStyle: Bool = false
    var pathRouter: String = "home"
    
    var body: some View {
        
        GeometryReader{ proxy in
            NavLink(to: pathRouter) {
                Text(label)
//                    .font(Font.system(size: labelSize, weight: .bold, design: .default))
                    .font(.custom("CircularStd-Bold", size: labelSize))
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
            }
        }.if(isFixHeight == true, transform: { view in
            view.frame(height: height)
        })
        
    }
}

struct NavLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavLinkView()
    }
}
