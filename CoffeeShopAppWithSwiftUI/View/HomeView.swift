//
//  HomeView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter

struct Category {
   var name: String
   var icon: String
}

struct HomeView: View {
    
    @StateObject var state: State
    let nameAlias: String = "San"
    let categoryName = [
        Category(name:"coffee", icon:"☕️"),
        Category(name:"tea", icon:"🥃"),
        Category(name:"matcha", icon:"🍵"),
        Category(name:"pastry", icon:"🥐")
    ]
    let layout = [
        GridItem(GridItem.Size.adaptive(minimum: 120, maximum:300), spacing: 22, alignment: .none)
    ]
    
    var body: some View {
    
        VStack(spacing:0){
            ZStack{
                
                backgroundManipulate
                
                VStack(spacing:0){
                    NavigationBar(navTitle:"Coffee Shop", backgroundColor: .heroColor, colorBorderNav: .heroColor, hiddenBorderBottom: false)
                
                    ScrollView(showsIndicators: false){
                        VStack(spacing:0){
                            // MARK: - First Section
                           firstSection
                      
                            ZStack{
                                VStack(spacing:0){}
                                    .frame(minWidth: 0, idealWidth: UIScreen.screenWidth, maxWidth: .infinity, minHeight: 0, idealHeight: UIScreen.screenHeight, maxHeight: .infinity, alignment: .center)
                                    .background(Color.heroColorBackground)
                                    .offset(x: 0, y: 100)
                                VStack(spacing:32){
                                   
                                    // MARK: - Second Section
                                secondSection
                                    // MARK: - Third Section
                                thirdSection
                                    // MARK: - Fourth Section
                                fourthSection
                                }
                                .padding()
                            }
                               
                        }
                    }
                }
                
               
            }
            
           
        }
       
       
               

    }
    
    var backgroundManipulate: some View {
        Group{
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
        }
    }
    
    var firstSection: some View {
        VStack(spacing: 30,content: {
            
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: nil){
                    Text("👋 Hai, \(nameAlias)")
                        .font(.custom("CircularStd-Bold", size: 32))
                        .foregroundColor(Color.heroColorText)
                    Text("Let's drink again!")
                        .font(.custom("CircularStd-Book", size: 18))
                        .foregroundColor(Color.heroColorText)
                }
                Spacer()
            }
            
            HStack(alignment: .top, spacing: nil) {
                VStack(alignment: .leading, spacing: nil){
                    Text("Point")
                        .font(.custom("CircularStd-Bold", size: 18))
                        .foregroundColor(Color.heroColorText)
                    Text("200.000")
                        .font(.custom("CircularStd-Bold", size: 24))
                        .foregroundColor(Color.heroColorText)
                }
                Spacer()
                .background(Color.gray)
            }
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Button {
                        state.showModalHome.toggle()
                        print("home address")
                    } label: {
                        HStack{
                            Image(systemName: "shippingbox").foregroundColor(Color.heroColorText)
                            Text("Home Address One")
                                .font(.custom("CircularStd-Bold", size: 14))
                                .foregroundColor(Color.heroColorText)
                        }
                    }
                }
                Spacer()
            }
            
        }).padding()
    }
    
    var secondSection: some View {
        VStack(content: {
            VStack(alignment: .center, content: {
                ImageSlideView().cornerRadius(20.0)
            })
            .frame(minWidth: 0,maxWidth: .infinity, minHeight: UIScreen.screenHeight / 6, maxHeight: .infinity, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.heroColorBackground, lineWidth: 10))
        })
    }
    
    var thirdSection: some View {
        ZStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(0..<categoryName.count){ data in
                        
                        
                        NavLink(to: "/category") {
                            HStack{
                                Text(categoryName[data].icon)
                                Text(categoryName[data].name)
//                                                                .font(Font.system(size: 16, weight: .medium, design: .default))
                                    .font(.custom("CircularStd-Medium", size: 14))
                                    .foregroundColor(.foregroundColorSchemeApp)
                                }
                                .frame(width: 120, height: 50, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10.0)
                                        .strokeBorder(lineWidth: 1.0, antialiased: true)
                                        .foregroundColor(.borderColorSchemeApp)
                                    )
                        }
                        
                            }
                        }
            }
    }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 70, maxHeight: .infinity, alignment: .center)
    }
    
    var fourthSection: some View {
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(state: State())
    }
}
