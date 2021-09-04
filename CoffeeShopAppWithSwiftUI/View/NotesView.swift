//
//  NotesView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 04/09/21.
//

import SwiftUI
import UIKit

struct NotesView: View {
    
    @StateObject var state: State
    
    var textSize16: CGFloat = 16
    var body: some View {
        VStack(spacing:0){
            NavigationBar(navTitle:"Add Notes", backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, hiddenBorderBottom: false)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing:30){
                    Text("Notes Max 250 Character")
//                        .font(Font.system(size: textSize16, weight: .heavy, design: .default))
                        .font(.custom("CircularStd-Bold", size: textSize16))
                        .foregroundColor(.foregroundColorSchemeApp)
                        .padding(.top, 40)
                    
                    MultilineTextFieldView(text: $state.initTextMultilineTextField, state: state)
                        .frame(height: state.initHeightTextMultineTextField < UIScreen.screenHeight/4 ? state.initHeightTextMultineTextField : UIScreen.screenHeight/4)
                        .padding()
                        .background(Color.backgroundColorSchemeApp)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.borderColorSchemeApp)
                        )
                    ButtonView(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, label: "\(-self.state.heightKeyboard)", isOutlineStyle: true, borderWidth: 1, borderColor: .heroColor)
                        
                   Spacer(minLength: 20)
                }
                .padding(.horizontal, 20)
            }
            .offset(y: self.state.heightKeyboard/4)
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { Notif in
                    
                    let value = Notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    
                    let height = value.height
                    
                    print("\(value)")
                    print("\(height/2.8)")
                    
                    self.state.heightKeyboard = height
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { Notif in

                    self.state.heightKeyboard = 0
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(state: State())
    }
}
