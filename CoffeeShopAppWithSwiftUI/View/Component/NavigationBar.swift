//
//  NavigationBar.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        VStack{
            HStack{
                Text("Coffee Shop")
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.heroColorText)
                Spacer()
                Image(systemName: "bell").foregroundColor(Color.heroColorText)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 0)
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
