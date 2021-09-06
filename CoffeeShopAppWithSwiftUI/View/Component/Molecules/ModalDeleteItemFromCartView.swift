//
//  ModalDeleteItemFromCartView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 06/09/21.
//

import SwiftUI

struct ModalDeleteItemFromCartView: View {
    @Binding var isShowing: Bool
    
    
    var body: some View {
        ZStack(alignment: .center){
            if isShowing{
                Color.darkLightColor
                    .opacity(0.8)
                .onTapGesture {
                    withAnimation {
                        self.isShowing = false
                    }
                }
                
                modalContent
                    .transition(AnyTransition.scale(scale: 0, anchor: .center))
                    
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.easeInOut(duration: 0.2))
    }
    
    var modalContent: some View {
        VStack(spacing: 30){
            Text("🚨")
                .font(Font.system(size: 30))
            Text("Are you sure delete this item?")
                .font(.custom("CircularStd-Bold", size: 16))
            HStack(spacing:30){
                ButtonView(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, colorWhenOutlineStyle: .foregroundColorSchemeApp, label: "Yes", labelSize: 14, height: 40, isFixHeight: true, isHeightDefault: false, isOutlineStyle: true, cornerRadius: 5, borderWidth: 1, borderColor: .foregroundColorSchemeApp, action: {
                   print("yes sir!")
                })
                ButtonView(backgroundColor: .backgroundColorSchemeApp, color: .red, colorWhenOutlineStyle: .red, label: "No", labelSize: 14, height: 40, isFixHeight: true, isHeightDefault: false, isOutlineStyle: true, cornerRadius: 5, borderWidth: 1, borderColor: .red, action: {
                    self.isShowing.toggle()
                })
            }
        }
        .padding(.top, 20)
        .padding(.bottom,30)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.screenWidth - 40, alignment: .center)
        .background(Color.backgroundColorSchemeApp)
        .cornerRadius(20)
        
    }
}

struct ModalDeleteItemFromCartView_Previews: PreviewProvider {
    static var previews: some View {
        ModalDeleteItemFromCartView(isShowing: .constant(true))
    }
}
