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
            VStack(spacing: 0){
                NavigationBar(navTitle:"Profile", backgroundColor: Color.heroColor)
           
//                Button {
//                    toggle()
//                } label: {
//                    Text("Halo")
//                }
//
//
//                VStack{
//                    Text("halo")
//                        .background(Color.red)
//                }
//

                HStack{
                    Button {
                        toggleNavigate()
                        print("\(state.bool)")
                    } label: {
                        Text("Halo")
                    }
                }
                .navigateTo(to: SettingsView(state: State()), when: $state.nextView)
                
                
//                VStack{
//                    ScrollView(showsIndicators: false){
//                        Spacer(minLength: 40)
//
//                        VStack {
////                            HStack(spacing: 20){
////                                    VStack{
////                                        Image("1")
////                                            .resizable()
////                                            .scaledToFill()
////                                            .frame(width: 80, height: 80)
////                                            .clipped()
////                                            .cornerRadius(26.0)
////                                    }
////
////                                    VStack(alignment: .leading){
////                                        Text("San Engineer")
////                                            .font(Font.system(size: 24, weight: .bold, design: .default))
////                                        Text("Profile, Edit, and more")
////                                            .font(Font.system(size: 16, weight: .regular, design: .default))
////                                    }
////
////                                    Spacer()
////
////                                        NavigationLink(
////                                            destination: Text("Destination"),
////                                            label: {
////                                                Image(systemName: "chevron.right").font(.body).accentColor(.primary)
////                                            }).navigationBarHidden(true)
////
////
////                                }
////                                .padding(.horizontal, 20)
////                                .padding(.vertical, 10)
////
//
//                        }
//
//                        Spacer(minLength: 60)
//
//
//
//                        VStack{
//
//
//
//
//
////                            Divider()
//
//
////                            HNavLinkWithEmojiText(destinationView: SettingsView(state: State())).navigationBarHidden(true)
////                            Divider()
////                            HNavLinkWithEmojiText(destinationView: SettingsView(state: State()))
////                            Divider()
////                            HNavLinkWithEmojiText(destinationView: SettingsView(state: State()))
////                            Divider()
//                        }
////                        Spacer(minLength: 60)
////                        VStack{
////                            Divider()
////                            HNavLinkWithEmojiText(destinationView: SettingsView(state: State()))
////                            Divider()
////                            HNavLinkWithEmojiText(destinationView: SettingsView(state: State()))
////                            Divider()
////                        }
//
//                    }
//                }

            }
           
         
//                .preferredColorScheme(state.colorScheme)
//            .offset(x: 0, y: -(UIScreen.screenHeight/33))
//
//
        
       
    }
    
    func toggleNavigate(){
        state.nextView = !state.nextView
    }
}

