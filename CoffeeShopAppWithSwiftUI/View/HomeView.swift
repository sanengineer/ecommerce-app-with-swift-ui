//
//  HomeView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct Category {
   var name: String
   var icon: String
}

struct HomeView: View {
    
    @StateObject var state: State
    let nameAlias: String = "San"
    let categoryName = [
        Category(name:"coffee", icon:"👋"),
        Category(name:"tea", icon:"👋"),
        Category(name:"matcha", icon:"👋"),
        Category(name:"pastry", icon:"👋")
    ]
    let layout = [
        GridItem(GridItem.Size.adaptive(minimum: 120, maximum:300), spacing: 22, alignment: .none)
    ]
    
    var body: some View {
    
        VStack(){
            ZStack{
                
                HStack{
                }
                .frame(width: UIScreen.screenWidth, height:(UIScreen.screenHeight - 120))
                .background(Color.heroColor)
                .offset(x: 0, y: -(UIScreen.screenHeight/4))
              
                HStack(){
                    
                }
                .frame(width: UIScreen.screenWidth, height:(UIScreen.screenHeight - 120))
                .background(
                        Image("HeroHomeBackgroundImage")
                            .resizable()
                            .scaledToFill()
                    )
                
                HStack(){
                    
                }
                .frame(width: UIScreen.screenWidth, height:(UIScreen.screenHeight - 120))
                .background(Color.heroColor)
                .mask(
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                )
                .offset(x: 0, y: self.state.ratio == state.aspectScreen ? 46 : 68 )

                
                HStack{

                }
                .frame(width: UIScreen.screenWidth, height:300)
                .background(Color.heroColorBackground)
                .offset(x: 0, y: 350)
                
                VStack(spacing:0){
                    NavigationBar(navTitle:"Coffee Shop", backgroundColor: .heroColor, colorBorderNav: .heroColor, hiddenBorderBottom: false)
                    .background(Color.red)
                
                    ScrollView(showsIndicators: false){
                        VStack(spacing:0){
                            // MARK: - First Section
                            VStack(spacing: 30,content: {
                                
                                HStack(alignment: .top){
                                    VStack(alignment: .leading, spacing: nil){
                                        Text("👋 Hai, \(nameAlias)")
                                            .font(Font.system(size: 32, weight: .bold, design: .default))
                                            .foregroundColor(Color.heroColorText)
                                        Text("Let's drink again!")
                                            .font(Font.system(size: 18, weight: .regular, design: .default))
                                            .foregroundColor(Color.heroColorText)
                                    }
                                    Spacer()
                                }
                                
                                HStack(alignment: .top, spacing: nil) {
                                    VStack(alignment: .leading, spacing: nil){
                                        Text("Point")
                                            .font(Font.system(size: 18, weight: .regular, design: .default))
                                            .foregroundColor(Color.heroColorText)
                                        Text("200.000")
                                            .font(Font.system(size: 24, weight: .bold, design: .default))
                                            .foregroundColor(Color.heroColorText)
                                    }
                                    Spacer()
                                    .background(Color.gray)
                                }
                                
                                HStack(alignment: .top){
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "shippingbox").foregroundColor(Color.heroColorText)
                                            Text("Home Address One")
                                                .font(Font.system(size: 14, weight: .medium, design: .default))
                                                .foregroundColor(Color.heroColorText)
                                        }
                                    }
                                    Spacer()
                                }
                                
                            }).padding()
                      
                            ZStack{
                                VStack{}
                                    .frame(minWidth: 0, idealWidth: UIScreen.screenWidth, maxWidth: .infinity, minHeight: 0, idealHeight: UIScreen.screenHeight, maxHeight: .infinity, alignment: .center)
                                    .background(Color.heroColorBackground)
                                    .offset(x: 0, y: 100)
                                VStack(spacing:32){
                                   
                                    // MARK: - Second Section
                                    VStack(content: {
                                        VStack(alignment: .center, content: {
                                            ImageSlideView().cornerRadius(20.0)
                                        })
                                        .frame(minWidth: 0,maxWidth: .infinity, minHeight: UIScreen.screenHeight / 6, maxHeight: .infinity, alignment: .center)
                                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.heroColorBackground, lineWidth: 10))
                                    })
                                    // MARK: - Third Section
                                    ZStack{
                                        ScrollView(.horizontal, showsIndicators: false){
                                            HStack(spacing: 20){
                                                ForEach(0..<categoryName.count){ data in
                                                    HStack{
                                                        Text(categoryName[data].icon)
                                                        Text(categoryName[data].name)
                                                            .font(Font.system(size: 16, weight: .medium, design: .default))
                                                        }
                                                        .frame(width: 120, height: 50, alignment: .center)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius:10.0)
                                                                .strokeBorder(lineWidth: 1.0, antialiased: true)
                                                                .foregroundColor(.gray).opacity(0.5)
                                                            )
                                                        }
                                                    }
                                        }
                                }
                                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 70, maxHeight: .infinity, alignment: .center)
                                    // MARK: - Fourth Section
                                    VStack(){
                                        LazyVGrid(columns:layout, spacing: 15){
                                            CardRoundedImageTextView()
                                            CardRoundedImageTextView()
                                            CardRoundedImageTextView()
                                            CardRoundedImageTextView()
                                            CardRoundedImageTextView()
                                            CardRoundedImageTextView()
                                        }
                                    }
                                    .offset(x: 0, y: -10)
                                }
                                .padding()
                            }
                               
                        }
                    }
                }
            }
        }
       
       
               

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
