//
//  MainView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 01/09/21.
//

import SwiftUI
import SwiftUIRouter

struct MainView: View {

    @StateObject var state : State
    
    var body: some View {
        
        VStack(spacing: -5){
            
            ZStack{
                switch state.tabCollection[state.selectionTab].tabName {

                case "Menu":
                    MenuView(state: state)

                case "Cart":
                     CartView()

                case "Profile":
                    ProfileView(state: state)
                        .ignoresSafeArea(.all)
                default :
                    HomeView(state: state)
                    .ignoresSafeArea(.all)
                }
            }

            Spacer()
            
            TabBarView(state: state)
//            TabBarViewWithRouter(state: state)
          
        }
        .ignoresSafeArea(.all)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
