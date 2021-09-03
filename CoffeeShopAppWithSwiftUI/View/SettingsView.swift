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
                            print("\(state.bool)")
                            self.state.bool.toggle()
                            
                            UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.state.bool ? .dark : .light
//                            toggleTheme()
//                            if state.bool{
//                                self.state.labelThemeColor = "Light"
//                                self.state.iconName = "sun.min"
//                            } else {
//                                self.state.iconName = "moon"
//                                self.state.labelThemeColor = "Dark"
//                            }
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
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
    
    func toggleTheme(){
        state.bool = !state.bool
    }
}

