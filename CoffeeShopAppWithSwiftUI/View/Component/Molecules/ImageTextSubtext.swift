//
//  ImageTextSubtext.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 01/09/21.
//

import SwiftUI

struct ImageTextSubtext: View {
    
    var title: String = "Title"
    var subtitle: String = "Subtitle, subtitle, sub"
    var textSize24: CGFloat = 24
    var textSize16: CGFloat = 16
    
    
    var body: some View {
        HStack(spacing: 20){
                VStack{
                    Image("1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                        .cornerRadius(26.0)
                }

                VStack(alignment: .leading){
                    Text(title)
//                        .font(Font.system(size: 24, weight: .bold, design: .default))
                        .font(.custom("CircularStd-Bold", size: textSize24))
                    Text(subtitle)
//                        .font(Font.system(size: textSize16, weight: .regular, design: .default))
                        .font(.custom("CircularStd-Book", size: textSize16))
                }

                Spacer()

                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "chevron.right").font(.body).accentColor(.primary)
                        }).navigationBarHidden(true)


            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}

struct ImageTextSubtext_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextSubtext()
    }
}
