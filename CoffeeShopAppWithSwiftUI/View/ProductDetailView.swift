//
//  ProductDetailView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI
import SwiftUIRouter

struct ProductDetailView: View {
    
    @StateObject var state: State
    
    var textSize: CGFloat = 16
    var textSize14: CGFloat = 14
    var textSize20: CGFloat = 20
    var textSize18: CGFloat = 18
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle:"Product Detail",backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing:20){
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2.7)
                    
                    VStack(alignment: .leading,spacing:20){
                        HStack(alignment: .center){
                            Text("Hallo")
//                                .font(Font.system(size: textSize, weight: .heavy, design: .default))
                                .font(.custom("CircularStd-Bold", size: textSize))
                            Image(systemName: "circle.fill")
                                .font(Font.system(size: 8, weight: .bold, design: .default))
                            Text("250ml")
//                                .font(Font.system(size: textSize, weight: .bold, design: .default))
                                .font(.custom("CircularStd-Book", size: textSize))
                            
                            Spacer()
                            Image(systemName: "heart")
                                .font(Font.system(size: 24, weight: .medium, design: .default))
                            
                        }
                        .padding(.top, 20)
                        
                        
                        Group{
                            Text("Hallo Hallo Hallo Hallo Hallo Hallo Hallo")
//                                .font(Font.system(size: textSize, weight: .heavy, design: .default))
                                .font(.custom("CircularStd-Bold", size: textSize))
                                .lineLimit(2)
                            Text("Hallo Hallo Hallo Hallo Hallo Hallo HallHallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo Hallo")
//                                .font(Font.system(size: textSize, weight: .medium, design: .default))
                                .font(.custom("CircularStd-Book", size: textSize))
                                .lineLimit(6)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
                
                Divider()
                
                VStack(alignment: .trailing, spacing:20){
                    HStack{
                        Text("Hallo")
//                            .font(Font.system(size: textSize, weight: .heavy, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize))
                        Spacer()
                    }
                    
                    Group{
                        HStack(spacing: 10){
                            ForEach(0..<3){ _ in
                                Text("normal")
//                                    .font(Font.system(size: textSize14, weight: .medium, design: .default))
                                    .font(.custom("CircularStd-Book", size: textSize14))
                                    .frame(width:50)
                            }
                        }
                    }
                    .offset(x: -100, y: 0)
                    
                    HStack{
                        VStack(spacing:20){
                            HStack(alignment: .center, spacing: 0){
                                Text("Sugar")
//                                    .font(Font.system(size: textSize, weight: .heavy, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize))
                                Spacer(minLength: 10)
                                
                                    RadioButton()
                                    RadioButton()
                                    RadioButton()
                              
                            }
                            HStack(spacing: 0){
                                Text("Ice")
//                                    .font(Font.system(size: textSize, weight: .heavy, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize))
                                Spacer(minLength: 10)
                                
                                    RadioButton()
                                    RadioButton()
                                    RadioButton()
                            }
                            
                        }
                        .frame(width:250)
                        
                        Spacer()
                    }
                   
                }
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                Divider()
               
                VStack(spacing: 0){
                    HStack(spacing:0){
                        
                        NavLink(to: "/product/1/add_notes") {
                            Text("Add Notes")
//                                .font(Font.system(size: 16, weight: .heavy, design: .default))
                                .font(.custom("CircularStd-Bold", size: 16))
                                .foregroundColor(.heroColor)
                        }
                        
                        Spacer()
                    }
                    
                }
                .frame(alignment: .leading)
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
                Divider()
                
                VStack(spacing: 0){
                    HStack(spacing:30){
                        Text("Quantity")
//                          .font(Font.system(size: textSize, weight: .heavy, design: .default))
                            .font(.custom("CircularStd-Bold", size: textSize))
                        
                        HStack(spacing:0){
                            Button(action: {}, label: {
                                Image(systemName: "minus.circle")
                                    .font(Font.system(size: 24, weight: .medium, design: .default))
                                    .foregroundColor(.foregroundColorSchemeApp)
                            })
                            Spacer(minLength: 2)
                            VStack{
                                Text("99")
//                                    .font(Font.system(size: textSize20, weight: .bold, design: .default))
                                    .font(.custom("CircularStd-Bold", size: textSize18))
                                    .foregroundColor(.foregroundColorSchemeApp)
                                    .padding(.bottom, 6)
                            }
                            .frame(width: 30)
                            .border(width: 3, edges: [.bottom], color: .darkLightColor, opacity: 0.5)
                            
                            Spacer(minLength: 2)
                            Button(action: {}, label: {
                                Image(systemName: "plus.circle")
                                    .font(Font.system(size: 24, weight: .medium, design: .default))
                                    .foregroundColor(.foregroundColorSchemeApp)
                            })
                        }.frame(width: 100, height: 40, alignment: .center)
                        
                       
                        Spacer()
                    }
                    
                }
                .frame(alignment: .leading)
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                
            }
            
            Divider()
            VStack(spacing: 0){
                HStack{
                   
                    NavLink(to: "/cart/order") {
                        HStack{
                            Text("⚡️")
                            .font(Font.system(size: textSize20, weight: .medium, design: .default))
                            Text("Fast Buy")
//                            .font(Font.system(size: 16, weight: .heavy, design: .default))
                            .font(.custom("CircularStd-Medium", size: textSize))
                            .foregroundColor(.foregroundColorSchemeApp)
                        }
                       
                        .frame(width: 140, height: 50)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.heroColor)
                                .opacity(0.5)
                        )
                        
                    }
                  
                    Spacer()
                    
                   
                    NavLink(to: "/cart/order") {
                        HStack{
                            Text("Add Cart")
//                            .font(Font.system(size: textSize, weight: .heavy, design: .default))
                                .font(.custom("CircularStd-Medium", size: textSize))
                            .foregroundColor(.foregroundColorSchemeApp)
                            Text("🛒")
                            .font(Font.system(size: textSize20, weight: .medium, design: .default))
                        }
                        .frame(width: 140, height: 50)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.heroColor).opacity(0.5)
                        )
                    }
                    
                        
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, state.ratio == state.aspectScreen ? 20 : 40)
                
            }
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
        
    }
}

struct RadioButton: View {
    var body: some View{
        VStack(alignment: .center, spacing: 0){
            ZStack{
                Circle()
                    .fill(Color.foregroundColorSchemeApp)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.backgroundColorSchemeApp)
                    .frame(width: 10, height: 10)
            }
        }
        .frame(width:58,height: 16)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(state: State())
    }
}
