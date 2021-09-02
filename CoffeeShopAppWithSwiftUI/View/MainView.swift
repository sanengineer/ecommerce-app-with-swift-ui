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
            
//            ZStack{
//                switch state.tabCollection[state.selectionTab].path {
//
//                case "/menu":
//                    Route(path:"/menu") {
//                        MenuView(state: state)
//                    }
//
//                case "/cart":
//                    Route(path: "/cart") {
//                        CartView()
//                    }
//
//                case "/profile":
//                    Route(path: "/profile") {
//                        ProfileView(state: state)
//                    }
//                default :
//                    Route {
//                        HomeView(state: state)
//                        .ignoresSafeArea(.all)
//                    }
//
//                }
//            }
//
//
//            ZStack{
//                SwitchRoutes {
//                    Route(path: "/menu") {
//                        MenuView(state: state)
//                    }
//                    Route(path: "/cart") { info in
//                        CartView()
//                    }
//
//                    Route(path: "/profile") {
//                        ProfileView(state: state)
//                    }
//                    Route {
//                        HomeView(state: State())
//                    }
//                }
//            }
            
            ZStack{
                switch state.tabCollection[state.selectionTab].tabName {

                case "Menu":
                    MenuView(state: state)

                case "Cart":
                     CartView()

                case "Profile":
                    ProfileView(state: state)
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
