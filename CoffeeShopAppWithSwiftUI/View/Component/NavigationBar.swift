//
//  NavigationBar.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct NavigationBar: View {
    
    var navTitle: String = "\(UIScreen.screenHeight)"
    var backgroundColor: Color = .heroColor
    var divideNumber: CGFloat = 9.35
    var color: Color = .heroColorText
    var titleSize: CGFloat = 20
    var hiddenLeftBarButton: Bool = true
    var leftBarButtonYPoint: CGFloat = 5
    var hiddenBorderBottom: Bool = true
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            if (hiddenLeftBarButton == false) {
                Button(action: {
                    print("Nav Left Button")
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(color)
                })
                .padding(.leading, 20)
                .offset(x: 0, y: leftBarButtonYPoint)
            } else {
                EmptyView()
            }
            
            HStack(alignment: .bottom, spacing: 0){
               
                Group{
                    Text(navTitle)
                        .font(Font.system(size: titleSize, weight: .bold, design: .default))
                        .foregroundColor(color)
                    Spacer()
                    Image(systemName: "bell").foregroundColor(color)
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

