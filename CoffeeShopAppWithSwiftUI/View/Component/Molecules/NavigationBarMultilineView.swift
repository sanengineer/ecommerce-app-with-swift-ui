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
    var navTitleLine2: String = "\(UIScreen.screenHeight)"
    var backgroundColor: Color = .heroColor
    var colorBorderNav: Color = .borderColorSchemeApp
    var divideNumber: CGFloat = 9.35
    var color: Color = .heroColorText
    var titleSize: CGFloat = 20
    var titleSizeLine2: CGFloat = 20
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
//                            .font(Font.system(size: titleSize, weight: .bold, design: .default))
                            .font(.custom("CircularStd-Bold", size: titleSize))
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
                
                if state.isExpandNavBar {
                    HStack(alignment:.center, spacing: 0){
                        Button {
                            self.state.isExpandNavBar.toggle()
                        } label:{
                            Text(navTitleLine2)
//                                .font(Font.system(size: titleSizeLine2, weight: .bold, design: .default))
                                .font(.custom("CircularStd-Bold", size: titleSizeLine2))
                                .foregroundColor(color).opacity(0.5)
                        }
                    }
                    .frame(height: 48)
                }
            }
            .offset(x: 0, y: 0)
        }
        .frame(height: state.isExpandNavBar ? (UIScreen.screenHeight/(divideNumber) * 2) - 42.25 : UIScreen.screenHeight/(divideNumber))
        .background(Color.backgroundColorSchemeApp)
        .padding(.horizontal, 20)
        .border(width: 1, edges: [.bottom], color: hiddenBorderBottom ? .backgroundColorSchemeApp : colorBorderNav, opacity: 1.0)
    }
}
