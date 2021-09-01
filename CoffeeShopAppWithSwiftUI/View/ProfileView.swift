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

//                HStack{
//                    Button {
//                        toggleNavigate()
//                        print("\(state.nextView)")
//                    } label: {
//                        Text("Halo")
//                    }
//                }
//
                
                VStack{
                    ScrollView(showsIndicators: false){
                        Spacer(minLength: 40)

                        VStack(spacing: 60) {
                            VStack {
                               ImageTextSubtext(title: "San Engineer", subtitle: "Profile, edit and more")
                            }
                            
                            VStack(spacing: 20){
                                ForEach(0..<(self.state.profileCollection.count)){ item in
                                    let collection = state.profileCollection[item]
                                    
                                    HNavLinkWithEmojiText(emoji: collection.icon , title: collection.title, caption: (collection.subtitle ?? ""), destinationView: SettingsView(state: State()))
                                    
                                    if(item == state.profileCollection.distance(from: state.profileCollection.startIndex, to: state.profileCollection.endIndex - 3)) {
                                        Spacer(minLength: 40)
                                    }
                                }
                                
                                
                            }
                            
                            VStack(){
                                Text("Logout")
                            }
                        }
                        .padding(.bottom, 100)
                    }
                }

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

