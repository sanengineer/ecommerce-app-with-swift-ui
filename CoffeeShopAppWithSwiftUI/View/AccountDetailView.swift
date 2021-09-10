//
//  AccountDetailView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 07/09/21.
//

import SwiftUI

struct AccountDetailView: View {
    
    @StateObject var state: State
    var heightFrameImage: CGFloat =  UIScreen.screenHeight / 4.5
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle: "Account", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, pathRouterLeftBar: "/profile")
            
            VStack(spacing:UIScreen.screenHeight / 8.5){
                firstSection
                    .padding(.top, 30)
                
                secondSection
                    .padding(.horizontal,20)
            }
            
            Spacer()
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
    
    var firstSection: some View {
        VStack{
            GeometryReader{ geometry in
                ZStack(alignment: .bottom){
                    VStack{
                        Image("1")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                    
                    
                        Button(action: {
                            state.showModalEditProfilePict.toggle()
                        }) {
                            VStack{
                                Text("Edit")
                                    .font(.custom("CircularStd-Bold", size: 16))
                                    .foregroundColor(.backgroundColorSchemeApp)
                            }
                            .frame(width: geometry.size.width, height: 40, alignment: .center)
                            
                        }
                       
                        .background(Color.foregroundColorSchemeApp).opacity(0.5)
                 
                    
                }
                .cornerRadius(heightFrameImage/3.5)
                .overlay(
                    RoundedRectangle(cornerRadius: heightFrameImage/3.5)
                        .stroke(lineWidth: 0)
                )
            
            }
        }
        .frame(width: heightFrameImage, height: heightFrameImage)
    }
    
    var secondSection: some View {
        VStack(spacing: 40){
            ForEach(0..<2){_ in
                VTextSubtextView(text: "Username", textSize: 16, subtext: "sanengineer", subtextSize: 16, hiddenButton: false, paddingActive: false, pathRouter: "/home", isHeroFontActive: true,heroFontWeightText: "Bold", heroFontWeightSubtext: "Book")
            }
        }
    }
}

