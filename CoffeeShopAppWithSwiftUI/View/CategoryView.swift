//
//  CategoryView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI
import SwiftUIRouter

struct CategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let layout = [
        GridItem(GridItem.Size.adaptive(minimum: 120, maximum:300), spacing: 22, alignment: .none)
    ]
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle:"☕️ Coffee",backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false, pathRouterLeftBar: "/home")
            
//            VStack(){
//                Button {
//                    self.presentationMode.wrappedValue.dismiss()
//                } label: {
//                    Text("Halo")
//                }
//
//            }
            
            ScrollView(showsIndicators: false){
                Spacer(minLength: 20)
                LazyVGrid(columns:layout, spacing: 30){
                    ForEach(0..<8){ _ in
                        CardImageTextButtonView(pathRouter: "/product/1")
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 80)
               
            }
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
