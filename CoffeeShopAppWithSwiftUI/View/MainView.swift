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
                VStack(spacing: 0){
                    ZStack{
                        switch state.tabCollection[state.selectionTab].tabName {

                        case "Menu":
                            MenuView(state: state)

                        case "Cart":
                            CartView(state: state)

                        case "Profile":
                            ProfileView(state: state)
                                .ignoresSafeArea(.all)
                        default :
                            HomeView(state: state)
                            .ignoresSafeArea(.all)
                        }
                    }

                    Spacer(minLength: 0)
                    
                    TabBarView(state: state)
                }
                .if(state.showModalHome || state.shohModalDelteItemOnCart, transform: { view in
                    view
                        .blur(radius: 2)
                })
            }
        }
        .ignoresSafeArea(.all)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
