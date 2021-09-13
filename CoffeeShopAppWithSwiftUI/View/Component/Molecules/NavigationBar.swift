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
    var colorBorderNav: Color = .borderColorSchemeApp
    var divideNumber: CGFloat = 9.35
    var color: Color = .heroColorText
    var titleSize: CGFloat = 20
    var iconName: String = "bell"
    var iconLeftName: String = "chevron.left"
    var hiddenLeftBarButton: Bool = true
    var hiddenBorderBottom: Bool = true
    var hiddenRightBarButton: Bool = true
    var pathRouterLeftBar: String = "home"
    var pathRouterRightBar: String = "home"
    var showTitle: Bool = true
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack(alignment: .center, spacing: 0){
                Group{
                    if (hiddenLeftBarButton == false) {
                        NavLink(to: pathRouterLeftBar){
                            Image(systemName: iconLeftName)
                                .font(Font.system(size: 20, weight: .medium, design: .default))
                           
                                .foregroundColor(color)
                        }
                        Spacer()
                    } else {
                        EmptyView()
                    }
                    
                    if showTitle == false && hiddenRightBarButton == true {
                        Text("Halo")
                            .font(.custom("CircularStd-Medium", size: titleSize))
                            .foregroundColor(.backgroundColorSchemeApp)
                    } else {
                        Text(navTitle)
                            .font(.custom("CircularStd-Medium", size: titleSize))
                            .foregroundColor(color)
                    }
                   
                    Spacer()
                    if hiddenRightBarButton == false {
                        NavLink(to: pathRouterRightBar) {
                            Image(systemName: iconName)  .font(Font.system(size: 20, weight: .medium, design: .default))
                                .foregroundColor(color)
                        }
                        
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
        .border(width: 1, edges: [.bottom], color: hiddenBorderBottom ? .backgroundColorSchemeApp : colorBorderNav, opacity: 1.0)
    }
}


struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}

