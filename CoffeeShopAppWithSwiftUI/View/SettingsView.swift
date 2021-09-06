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
            NavigationBar(navTitle: "Settings", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp,hiddenLeftBarButton: false, hiddenBorderBottom: false)
            
            
            VStack(spacing: 0){
                VStack(alignment: .leading, spacing:10){
                        Text("Change Theme")
                            .font(Font.custom("CircularStd-Bold", size: 16))
                        Toggle(isOn: $state.bool) {
                            HStack(spacing:8){
                                Image(systemName: self.state.bool ?  "sun.min" : "moon" )
                                    .font(Font.system(size: 20, weight: .medium, design: .default))
                                Text("\(self.state.bool ? "Light" : "Dark")")
                                    .font(Font.custom("CircularStd-Book", size: 16))
                            }
                        }
                    }
                    .padding(.top, 40)
                
                
                
                
              
            }
            .padding(.horizontal, 20)
           
           
            Spacer()
         
            
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
    
    func toggleTheme(){
        state.bool = !state.bool
    }
}

