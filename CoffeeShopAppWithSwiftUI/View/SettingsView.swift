//
//  SettingsView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 31/08/21.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var state: State
    @SwiftUI.Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        
        VStack{
            
            Image(systemName: "chevron.left")
                .frame(width: 30)
                .onTapGesture(count: 1, perform: {
                        self.mode.wrappedValue.dismiss()
                    })
                
            
            Button {
                toggleTheme()
                if state.bool == false {
                    self.state.colorScheme = .dark
                    self.state.labelThemeColor = "Light"
                    self.state.iconName = "sun.min"
                } else {
                    self.state.colorScheme = .light
                    self.state.iconName = "moon"
                    self.state.labelThemeColor = "Dark"
                }
            } label: {
                HStack(spacing:8){
                    Image(systemName: state.iconName)
                    Text("\(state.labelThemeColor)")
                }
            }
        }
        .preferredColorScheme(state.colorScheme)
    }
    
    func toggleTheme(){
        state.bool = !state.bool
    }
}

