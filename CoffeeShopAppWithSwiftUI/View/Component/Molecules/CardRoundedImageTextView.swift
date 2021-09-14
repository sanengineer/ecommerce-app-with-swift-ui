//
//  CardRoundedImageTextView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import SwiftUI

struct CardRoundedImageTextView: View {
    var body: some View {
        VStack(alignment: .center,spacing:0){
            VStack(spacing:0){
                Image("1")
                    .resizable()
                    .scaledToFill()
            }
            .frame(minWidth: 100, maxWidth: .infinity ,minHeight:90, maxHeight: 100)
            .background(Color.red)
                    
            VStack(spacing:0){
                VStack(alignment: .leading, spacing: 10){
                Text("Coffee Double Shot Double Shot Double Shot - 250ml Coffee Coffee Coffee")
                    .font(.custom("CircularStd-Book", size: 14))
                    .lineLimit(8)
                    .frame(minHeight:74)
                Text("Rp 20.000")
                    .font(.custom("CircularStd-Medium", size: 14))
                }
                .layoutPriority(100)
                Spacer(minLength: 0)
            }
            .padding()
        }
        .cornerRadius(10, antialiased: true)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 1, antialiased: true)
                .foregroundColor(.borderColorSchemeApp)
        )
    }
}

struct CardRoundedImageTextView_Previews: PreviewProvider {
    static var previews: some View {
        CardRoundedImageTextView()
    }
}
