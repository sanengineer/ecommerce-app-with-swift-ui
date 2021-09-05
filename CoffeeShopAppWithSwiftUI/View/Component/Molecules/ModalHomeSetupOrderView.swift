//
//  ModalHomeSetupOrderView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 05/09/21.
//

import SwiftUI

struct ModalHomeSetupOrderView: View {
    
    @Binding var isShowing:Bool
    @StateObject var state: State
    
    let minHeight: CGFloat = (UIScreen.screenHeight/UIScreen.screenWidth) == (16/9) ? 280 : 300
    let maxHeight: CGFloat = (UIScreen.screenHeight/UIScreen.screenWidth) == (16/9) ? 280 : 300
    
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPrecentage: Double {
        let res = Double((state.currentHeightModalHomeSetupOrder - minHeight)/(maxHeight - minHeight))
        return max(0,min(1, res))
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.darkLightColor
                    .opacity(startOpacity +  (endOpacity - startOpacity) * dragPrecentage)
                    .onTapGesture {
                        self.isShowing = false
                    }
                
                modalContent
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .bottom)
        .animation(.easeInOut(duration: 0.2))
        .ignoresSafeArea(.all)
    }
    
    var modalContent: some View {
        VStack(spacing:0){
            VStack(spacing: 0){
                VStack(spacing:0){
                    Capsule()
                        .foregroundColor(.foregroundColorSchemeApp)
                        .opacity(0.5)
                        .frame(width:80, height: 6)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
//                        .offset(x: 0, y: -10)
                }
                .frame(maxHeight: 40)
                .frame(maxWidth: .infinity)
                .background(Color.foregroundColorSchemeApp.opacity(0.00001))
                .gesture(dragGesture)
                .offset(x: 0, y: -10)
                
                VStack(alignment: .leading, spacing:20){
                    Button {
                        print("set home")
                    } label: {
                        HStack{
                            Text("📦").font(Font.system(size: 24))
                            HStack{
                                Text("Send to")
                                    .font(.custom("CircularStd-Book", size: 16))
                                Text("\(state.defaultAddress)")
                                    .font(.custom("CircularStd-Bold", size: 16))
                            }
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    .foregroundColor(.foregroundColorSchemeApp)
                    
                    Button {
                        print("set pickup")
                    } label: {
                        HStack{
                            Text("🤚🏾").font(Font.system(size: 24))
                            Text("Pickup At Store")
                                    .font(.custom("CircularStd-Book", size: 16))
                            Spacer()
                        }
                        .padding(.vertical, 10)
                       
                    }
                    .foregroundColor(.foregroundColorSchemeApp)
                    
                    ButtonView(backgroundColor: .backgroundColorSchemeApp, colorWhenOutlineStyle: .red, label: "Close", labelSize: 16, isOutlineStyle: true, borderWidth: 1, borderColor: .red)
                    
                   
                }
                    .background(Color.backgroundColorSchemeApp)
            }
            .padding(.top,10)
            .padding(.horizontal, 20)
            .padding(.bottom, state.aspectScreen == state.ratio ? 20 : 60)
            .frame(maxWidth: UIScreen.screenWidth)
//            .background(Color.green)
        }
        .background(
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20)
                Rectangle()
                    .frame(height: state.currentHeightModalHomeSetupOrder/2)
            }
            .foregroundColor(.backgroundColorSchemeApp)
        )
        .frame(maxHeight: state.currentHeightModalHomeSetupOrder)
        .frame(maxWidth:.infinity)
        .animation(state.draggingModal ? nil : .easeInOut(duration: 0.25))
        .onDisappear{
            state.currentHeightModalHomeSetupOrder = minHeight
        }
    }
    
    
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { drag_gesture_value in
                
                let dragPoint = drag_gesture_value.translation.height - state.prevDragTranslationModal.height
                state.currentHeightModalHomeSetupOrder -= dragPoint
                state.prevDragTranslationModal = drag_gesture_value.translation
    
                if (dragPoint + 100) > state.currentHeightModalHomeSetupOrder {
                    self.isShowing = false
                }
            }
            .onEnded { drag_gesture_value in
                state.prevDragTranslationModal = .zero
                state.draggingModal = false
                state.currentHeightModalHomeSetupOrder = minHeight
            }
    }
}

struct ModalHomeSetupOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ModalHomeSetupOrderView(isShowing: .constant(true), state: State())
    }
}
