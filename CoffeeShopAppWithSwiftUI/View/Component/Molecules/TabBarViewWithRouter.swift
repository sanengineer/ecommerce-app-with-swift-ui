//
//  TabBarViewWithRouter.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//
//
//import Foundation
//import SwiftUI
//import SwiftUIRouter
//
//struct TabBarViewWithRouter: View {
//
//    @StateObject var state : State
//    
//
//    var body: some View {
//
//
//            HStack{
//                ForEach(0..<(self.state.tabCollection.count)){ int in
//                   
//                        NavLink(to: state.tabCollection[int].path) { active in
//                            
//                            VStack(alignment:.center, spacing:4){
//                                Image(active == state.tabCollection[int].path ? self.state.tabCollection[int].tabIconActive : self.state.tabCollection[int].tabIconDeactive)
//                                    .antialiased(true)
//                                    .resizable()
//                                    .frame(width: 24, height: 24)
//
//                                Text(self.state.tabCollection[int].tabName)
//                                    .font(Font.system(size: 14, weight: active ? .heavy : .regular, design: .default))
//                                    .foregroundColor(.black)
//                            }
//                        .frame(width: 60)
//
//
//                        }
//                        if int != (state.tabCollection.endIndex - 1) {
//                            Spacer()
//                        }
//                   
//
//
//
//                }
//            }
//
//            .padding(.horizontal, 30)
//            .padding(.top, 12)
//            .padding(.bottom, (self.state.ratio) == (self.state.aspectScreen) ? 6 : 30 )
//            .background(Color.white)
//            .border(width: 1, edges:[.top], color: Color.darkLightColor, opacity: 1.0)
//
//
//    }
//}
//
//
//struct TabBarViewWithRouter_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarViewWithRouter(state: State())
//    }
//}
