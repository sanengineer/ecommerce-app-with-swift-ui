//
//  ProfileView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @StateObject var state: State
    
    var body: some View {
        
        VStack{
            Button {
                if state.bool {
                    state.bool.toggle()
                    state.colorScheme = .dark
                    state.labelThemeColor = "Dark"
                    state.iconName = "moon"
                } else {
                    state.bool.toggle()
                    state.colorScheme = .light
                    state.iconName = "sun.min"
                    state.labelThemeColor = "Light"
                }
            } label: {
                HStack(spacing:8){
                    Image(systemName: state.iconName)
                    Text("\(state.labelThemeColor)")
                }
            }
        }.preferredColorScheme(state.colorScheme)
    }
    
    func toggleTheme(){
        state.bool = !state.bool
    }
}
