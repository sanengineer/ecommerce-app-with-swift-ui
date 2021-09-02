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
    var labelSize: CGFloat = 14
    var fieldSize: CGFloat = 14
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
                .font(Font.system(size: 14, weight: .bold, design: .default))
                .background(
                    Text(label)
                        .scaleEffect( hideLabelTextField ? (state.isfieldTextTapped ? 0.7 : 1.0) : 0.7)
                        .offset(x: hideLabelTextField ? (state.isfieldTextTapped ? -5 : -2) : -5, y: hideLabelTextField ? (state.isfieldTextTapped ? -24 : 0) : -24)
                        .foregroundColor( hideLabelTextField ? (state.isfieldTextTapped ? .heroColor : .white) : .black)
                        .opacity(hideLabelTextField ? (state.isfieldTextTapped ? 1.0 : 0 ) : 1.0)
                        .font(Font.system(size: hideLabelTextField ? (state.isfieldTextTapped ? 14 : 0) : 14 , weight: hideLabelTextField ? (state.isfieldTextTapped ? .bold : .ultraLight) : .bold, design: .default))
                        
                    
                    ,alignment: .leading
                )

            }
            .padding(.vertical, 12)
            .border(width: 1, edges: [.bottom], color: .darkLightColor, opacity: 1.0)
    }
}

struct VTextSubtextInputView_Previews: PreviewProvider {
    static var previews: some View {
        VTextSubtextInputView(state: State())
    }
}
