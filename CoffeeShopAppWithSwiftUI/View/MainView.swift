//
//  MainView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 01/09/21.
//

import SwiftUI

struct MainView: View {

    @StateObject var state : State
    
    var body: some View {
        
        VStack(spacing: -5){
            
            ZStack{
                switch state.tabCollection[state.selectionTab].tabName {
                
                case "Menu":
                    MenuView()
                    
                case "Cart":
                    NavigationView{
                        VStack(alignment:.leading, spacing: 8){
                            Text("Height: \(UIScreen.screenHeight)")
                            Text("Width: \(UIScreen.screenWidth)")
                            Text("Cross Result: \(UIScreen.screenHeight * UIScreen.screenWidth)")
                            Text("Aspect Screen: \(UIScreen.screenHeight / UIScreen.screenWidth)")
                            Text("Ratio:\(state.ratio)")
                            Text("Add Result: \(UIScreen.screenHeight + UIScreen.screenWidth)")
                            HStack{
                                Text("aspectRatio = RatioScreen:")
                                if state.ratio == state.aspectScreen {
                                    Text("match (TRUE)").fontWeight(.bold)
                                } else {
                                    Text("Not Match (FALSE)").fontWeight(.bold)
                                }
                            }
                        }
                    }
                
                case "Profile":
                    ProfileView(state: state)
                default :
                    HomeView(state: state)
                    .ignoresSafeArea(.all)
                }
            }
            
            Spacer()
            
            TabBarView(state: state)
        }
        .ignoresSafeArea(.all)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
