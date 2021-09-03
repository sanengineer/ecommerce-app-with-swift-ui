//
//  NavigationBarMultilineView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 03/09/21.
//

import SwiftUI
import SwiftUIRouter

struct NavigationBarMultilineView: View {
    var navTitle: String = "\(UIScreen.screenHeight)"
    var backgroundColor: Color = .heroColor
    var colorBorderNav: Color = .borderColorSchemeApp
    var divideNumber: CGFloat = 9.35
    var color: Color = .heroColorText
    var titleSize: CGFloat = 20
    var iconName: String = "bell"
    var hiddenLeftBarButton: Bool = true
    var hiddenBorderBottom: Bool = true
    var hiddenRightBarButton: Bool = true
    var pathRouterLeftBar: String = "home"
    var pathRouterRightBar: String = "home"
    var actionRightButton: () -> Void
    
    @StateObject var state: State
    
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing:0){
            Spacer(minLength: 10)
        
            VStack(spacing:0){
                HStack(alignment:.center, spacing: 0){
                    Group{
                        if (hiddenLeftBarButton == false) {
                            NavLink(to: pathRouterLeftBar){
                                Image(systemName: "chevron.left")
                                    .font(Font.system(size: 20, weight: .medium, design: .default))
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
                            Button(action: actionRightButton){
                                Image(systemName: iconName)  .font(Font.system(size: 20, weight: .medium, design: .default))
                                    .foregroundColor(color)
                            }.if(state.isExpandNavBar) { view in
                                view.rotationEffect(Angle.init(degrees: -180))
                            }
                            
                        } else {
                            EmptyView()
                        }
                       
                    }
                   
                }
                .frame(height: 48)
                .background(Color.gray)
                
                if state.isExpandNavBar {
                    HStack(alignment:.center, spacing: 0){
                            Text(navTitle)
                                .font(Font.system(size: titleSize, weight: .bold, design: .default))
                                .foregroundColor(color)
                    }
                    .frame(height: 48)
                    .background(Color.green)
                }
            }
            .background(Color.blue)
            .offset(x: 0, y: 0)
        }
        .frame(height: state.isExpandNavBar ? (UIScreen.screenHeight/(divideNumber) * 2) - 42.25 : UIScreen.screenHeight/(divideNumber))
        .background(Color.red)
        .padding(.horizontal, 20)
        .border(width: 1, edges: [.bottom], color: hiddenBorderBottom ? .backgroundColorSchemeApp : colorBorderNav, opacity: 1.0)
    }
}
