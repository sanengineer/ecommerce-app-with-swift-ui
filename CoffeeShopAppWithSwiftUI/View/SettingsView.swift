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
        
        
        VStack(spacing: 0){
            NavigationBar(navTitle: "Settings", hiddenLeftBarButton: false)
            
            
            VStack{
                    VStack{
                        Text("halo")
                    }
                    
                    VStack{
                     
                        
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
              
            }  .background(Color.red)
           
           
            Spacer()
         
            
        }
        .preferredColorScheme(state.colorScheme)
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
    
    func toggleTheme(){
        state.bool = !state.bool
    }
}

