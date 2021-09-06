//
//  ModalSetDefaultAddress.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 06/09/21.
//

import SwiftUI

struct ModalSetDefaultAddress: View {
    
    @Binding var isShowing:Bool
    @StateObject var state: State
       
    let minHeight: CGFloat = (UIScreen.screenHeight/UIScreen.screenWidth) == (16/9) ? 100 : 150
    let maxHeight: CGFloat = (UIScreen.screenHeight/UIScreen.screenWidth) == (16/9) ? 280 : 280
    
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
        ZStack(alignment: .top){
            ZStack(alignment:.top){
                VStack(alignment: .leading, spacing:20){
                    Button {
                        print("set home")
                    } label: {
                        HStack{
                            Text("🔧").font(Font.system(size: 24))
                            HStack{
                                Text("Set")
                                    .font(.custom("CircularStd-Book", size: 16))
                                Text("\(state.defaultAddress)mmmmmmmmmmmmmmmmmmmm")
                                    .font(.custom("CircularStd-Bold", size: 16))
                                Text("as default")
                                    .font(.custom("CircularStd-Book", size: 16))
                            }
                            .lineLimit(1)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    .foregroundColor(.foregroundColorSchemeApp)
                    
                    Button {
                        print("set pickup")
                    } label: {
                        HStack{
                            Text("🚨").font(Font.system(size: 24))
                            Text("Remove \(state.defaultAddress)")
                                    .font(.custom("CircularStd-Book", size: 16))
                            Spacer()
                        }
                        .padding(.vertical, 10)
                    }
                    .foregroundColor(.foregroundColorSchemeApp)
                    
                    ButtonView(backgroundColor: .backgroundColorSchemeApp, colorWhenOutlineStyle: .red, label: "Close", labelSize: 16, isOutlineStyle: true, borderWidth: 1, borderColor: .red) {
                        self.isShowing.toggle()
                    }
                    
                   
                }
                    .background(Color.backgroundColorSchemeApp)
            }
            .padding(.top, 0)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .frame(minHeight:maxHeight ,maxHeight: .infinity)
            .background(RoundedCornersSpecific(color: .backgroundColorSchemeApp,topRight: 30, bottomRight: 0, bottomLeft: 0, topLeft: 30))
            
            ZStack(alignment: .bottom){
                Capsule()
                    .foregroundColor(.foregroundColorSchemeApp)
                    .opacity(0.5)
                    .frame(width:40, height: 6)
                    .offset(x: 0, y: -8)
            }
            .frame(minHeight: 40, maxHeight: 40)
            .frame(maxWidth: .infinity)
            .background(RoundedCornersSpecific(color: .backgroundColorSchemeApp, topRight: 30, bottomRight: 0, bottomLeft: 0, topLeft: 30).opacity(0.00001))
            .gesture(dragGesture)
        }
        .frame(maxHeight: state.currentHeightModalHomeSetupOrder)
        .frame(maxWidth:.infinity)
        .animation(state.draggingModal ? nil : .easeInOut(duration: 0.25))
        .onDisappear{
            state.currentHeightModalHomeSetupOrder = maxHeight
        }
    }
    
    
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { drag_gesture_value in
                let dragPoint = drag_gesture_value.translation.height - state.prevDragTranslationModal.height
                
                state.currentHeightModalHomeSetupOrder -= dragPoint
                
                state.prevDragTranslationModal = drag_gesture_value.translation
    
                if state.currentHeightModalHomeSetupOrder > maxHeight {
                    state.currentHeightModalHomeSetupOrder = maxHeight
                } else if state.currentHeightModalHomeSetupOrder < minHeight {
                    self.isShowing = false
                }
            }
            .onEnded { drag_gesture_value in
                state.prevDragTranslationModal = .zero
                state.draggingModal = false
                state.currentHeightModalHomeSetupOrder = maxHeight
            }
    }
}

struct ModalSetDefaultAddress_Previews: PreviewProvider {
    static var previews: some View {
        ModalSetDefaultAddress(isShowing: .constant(true), state: State())
    }
}
