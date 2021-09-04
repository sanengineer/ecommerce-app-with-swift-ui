//
//  MultilineTextFieldView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI

struct MultilineTextFieldView: UIViewRepresentable {
    
    @Binding var text: String
//    @EnvironmentObject var envObject: State
    @StateObject var state: State
    
    func makeCoordinator() -> MultilineTextFieldView.Coordinator {
        return MultilineTextFieldView.Coordinator(parentOne: self)
    }
   
    func makeUIView(context: UIViewRepresentableContext<MultilineTextFieldView>) -> UITextView {
        
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14, weight: .medium)
        textView.text = "Add notes here..."
        textView.textColor = .none
        textView.backgroundColor = .clear
        textView.delegate = context.coordinator
        
        self.state.initHeightTextMultineTextField = textView.contentSize.height
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        
        return textView
        
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultilineTextFieldView>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {

        var parent: MultilineTextFieldView

        init(parentOne: MultilineTextFieldView) {
            parent = parentOne
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.state.initHeightTextMultineTextField = textView.contentSize.height
        }

        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .label
        }
    }

}
