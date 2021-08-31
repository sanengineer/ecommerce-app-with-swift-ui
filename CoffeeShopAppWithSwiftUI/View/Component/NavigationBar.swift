//
//  NavigationBar.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct NavigationBar: View {
    
    var navTitle: String
    var backgroundColor: Color
    var divideNumber: CGFloat = 9.35
    
    var body: some View {
        VStack(){
            Spacer()
            HStack(alignment: .bottom, spacing: 0){
               
                Group{
                    Text("\(UIScreen.screenHeight)")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(Color.heroColorText)
                    Spacer()
                    Image(systemName: "bell").foregroundColor(Color.heroColorText)
                }
//                .offset(x: 0, y:40)
               
            }
//            .offset(x: 0, y:100)
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
//            .background(navBackground Color)
           
            
            
//            .background(Color.red)
        }
        .frame(height: UIScreen.screenHeight/(divideNumber))
//        .offset(x: 0, y:100)
        .background(backgroundColor)
    }
}
