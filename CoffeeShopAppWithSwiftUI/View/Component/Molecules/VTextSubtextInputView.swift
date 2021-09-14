//
//  VTextSubtextInput.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 02/09/21.
//

import SwiftUI

struct VTextSubtextInputView: View {
    
    @StateObject var state: State
    var label: String = "Label"
    var labelSize: CGFloat = 16
    var fieldSize: CGFloat = 16
    var textSize14: CGFloat = 16
    var textWeight: Font.Weight = .bold
    var subtextWeight: Font.Weight = .regular
  
    var hideLabelTextField: Bool = true
    
    var body: some View {
            VStack(alignment: .leading, spacing: 6){
                TextField(label, text: $state.fieldText ) { status in
                        withAnimation(.easeIn){
                            state.isfieldTextTapped = true
                    }
                } onCommit: {
                    withAnimation(.easeOut){
                        state.isfieldTextTapped = false
                    }
                }
                .font(.custom("CircularStd-Medium", size: textSize14))
                .background(
                    Text(label)
                        .scaleEffect( hideLabelTextField ? (state.isfieldTextTapped ? 0.8 : 1.0) : 0.8)
                        .offset(x: hideLabelTextField ? (state.isfieldTextTapped ? -5 : -2) : -5, y: hideLabelTextField ? (state.isfieldTextTapped ? -30 : 0) : -30)
                        .foregroundColor( hideLabelTextField ? (state.isfieldTextTapped ? .heroColor : .white) : .black)
                        .opacity(hideLabelTextField ? (state.isfieldTextTapped ? 1.0 : 0 ) : 1.0)
                        .font(.custom( hideLabelTextField ? (state.isfieldTextTapped ? "CircularStd-Bold" : "CircularStd-Book") : "CircularStd-Bold", size: hideLabelTextField ? (state.isfieldTextTapped ? textSize14 : 0) : textSize14))
                        
                    
                    ,alignment: .leading
                )

            }
            .padding(.vertical, 12)
            .border(width: 1, edges: [.bottom], color: .borderColorSchemeApp, opacity: 1.0)
    }
}

struct VTextSubtextInputView_Previews: PreviewProvider {
    static var previews: some View {
        VTextSubtextInputView(state: State())
    }
}
