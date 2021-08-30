//
//  ImageSlideView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct ImageSlideView: View {
    
    private var numberImage = 3
    
    var body: some View {
        GeometryReader{ proxy in
            TabView {
                ForEach(0+1..<numberImage+1){ num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
        }
    }
}

struct ImageSlideView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlideView()
    }
}
