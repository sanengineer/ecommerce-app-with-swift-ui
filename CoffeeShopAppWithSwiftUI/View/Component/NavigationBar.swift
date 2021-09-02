//
//  NavigationBar.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI
import SwiftUIRouter

struct NavigationBar: View {
    
    var navTitle: String = "\(UIScreen.screenHeight)"
    var backgroundColor: Color = .heroColor
    var divideNumber: CGFloat = 9.35
    var color: Color = .heroColorText
    var titleSize: CGFloat = 20
    var hiddenLeftBarButton: Bool = true
    var leftBarButtonYPoint: CGFloat = 0
    var hiddenBorderBottom: Bool = true
    var hiddenRightBarButton: Bool = true
    var pathRouter: String = "home"
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            
            
            HStack(alignment: .center, spacing: 0){
               
                
                Group{
                    if (hiddenLeftBarButton == false) {
                        NavLink(to: pathRouter){
                            Image(systemName: "chevron.left")
                                .font(Font.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(color)
                        }
                        Spacer()
                    } else {
                        EmptyView()
                    }
                    
                    Text(navTitle)
                        .font(Font.system(size: titleSize, weight: .bold, design: .default))
                        .foregroundColor(color)
                    Spacer()
                    if hiddenRightBarButton == false{
                        Image(systemName: "bell").foregroundColor(color)
                    } else {
                        EmptyView()
                    }
                   
                }
               
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
        }
        .frame(height: UIScreen.screenHeight/(divideNumber))
        .background(backgroundColor)
        .if( hiddenBorderBottom == false, transform: { view in
            view.border(width: 1, edges: [.bottom], color: .darkLightColor, opacity: 1.0)
        })
    
        
        
    }
}


struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

