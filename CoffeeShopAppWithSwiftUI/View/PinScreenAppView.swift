//
//  PinScreenAppView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 10/09/21.
//

import SwiftUI

struct PinScreenAppView: View {
    @StateObject var state: State
    
    @SwiftUI.State var remaining = 1.0
    @SwiftUI.State var appearWrong: Bool = false
    @Binding var locked: Bool
   
    var timer = Timer.publish(every: 1.0, on: .current, in: .default).autoconnect()
    
 
    
    var body: some View {
        if locked {
            VStack(spacing:0){
                NavigationBar(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, showTitle: false)
                ZStack{
                    
                    VStack(spacing: UIScreen.screenHeight / 11){
                        VStack(spacing: UIScreen.screenHeight / 11){
                            Text("Enter Your Pin")
                                .font(Font.custom("CircularStd-Bold", size: 18))
                            
                            HStack(spacing: 20){
                                ForEach(0..<4, id:\.self){ index in
                                    CirclePinScreenOnBoard(index: index, pinScreen: $state.pinScreenOnBoard)
                                }
                            }
                            VStack{
                                if state.wrongPinScreen == true{
                                    Text("Wrong Pin")
                                        .font(Font.custom("CircularStd-Book", size: 14))
                                        .foregroundColor(.red)
                                        .animation(.spring())
                                        .opacity(self.state.wrongPinScreen ? 1.0 : 0.0)
                                        .if(self.state.wrongPinScreen == true, transform: { view in
                                            view
                                                .onReceive(timer) { _ in
                                                    
                                                    print("\(remaining)")
                                                        self.remaining -= 1.0
                                                    
                                                     if self.remaining == -1.0 {
                                                        self.remaining = 1.0
                                                        stopTimer()
                                                    }
                                                    
                                                    
                                                    if appearWrong == true {
                                                        print(true)
                                                    } else {
                                                        print(false)
                                                    }
                                                    
                                                    if state.wrongPinScreen == true {
                                                        print("WRONG PRINT SCREEN: \(true)")
                                                    } else {
                                                        print("WRONG PRINT SCREEN: \(false)")
                                                    }
                                                }
                                               
                                        })
                                        
                                        
                                    
                                } else {
                                    Text("...")
                                        .font(Font.custom("CircularStd-Book", size: 14))
                                        .foregroundColor(.backgroundColorSchemeApp)
                                    
                                }
                            }
                           
                        }
                        .onAppear {
                            if appearWrong == true {
                                print(true)
                            } else {
                                print(false)
                            }
                            
                            if state.wrongPinScreen == true {
                                print("WRONG PRINT SCREEN: \(true)")
                            } else {
                                print("WRONG PRINT SCREEN: \(false)")
                            }
                            
                            if state.isPinAvailable != nil {
                                print("check bool:")
                                print(true)
                            }
                            
//                            print("Check", state.isPinAvailable)
                        }
                        
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 40){
                            
                            
                            ForEach(1...9, id:\.self){ index in
                               
                                
                                KeyPadPinScreenOnBoard(value: "\(index)", pin: $state.pinScreenOnBoard, key_pin_storage: $state.key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $appearWrong, state: state, closeScreen: $locked)
                            }
                            
                            KeyPadPinScreenOnBoard(value: "delete.fill", pin: $state.pinScreenOnBoard, key_pin_storage: $state.key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $appearWrong, state: state, closeScreen: $locked)
                            
                            KeyPadPinScreenOnBoard(value: "0", pin: $state.pinScreenOnBoard, key_pin_storage: $state.key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $appearWrong, state: state, closeScreen: $locked)
                        }
                        .onAppear{
                            self.state.key_pin_storage = state.getPin()
                          
                        }
                        
                    }
                }
    //            .onReceive(timer, perform: { _ in
    //
    //                print("\(remaining)")
    //
    //                self.remaining -= 1.0
    //
    //                if self.remaining <= 0 && self.remaining >= -1.0{
    //                    print("Halo")
    //                } else if self.remaining == -2.0 {
    //                    stopTimer()
    //                }
    //            })
            }
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
            .background(Color.backgroundColorSchemeApp)
            .ignoresSafeArea(.all)
        }
       
    }
    
    func stopTimer(){
        timer.upstream.connect().cancel()
        state.wrongPinScreen = false
    }
}

struct CirclePinScreenOnBoard: View {
    var index: Int
    @Binding var pinScreen: String
    
    var body: some View {
      
        ZStack(alignment:.center){
                Circle()
                    .fill(Color.foregroundColorSchemeApp)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.backgroundColorSchemeApp)
                    .frame(width: 14, height: 14)
                
                if pinScreen.count > index {
                    Circle()
                        .fill(Color.foregroundColorSchemeApp)
                        .frame(width: 14, height: 14)
                        
                }
                
            }
        .onAppear{
            print("Check", pinScreen.count, "index:", index)
        }
        .transition(.scale(scale: 0, anchor: .center))
         
    }
}

struct KeyPadPinScreenOnBoard: View {
    
    var value: String
    @Binding var pin: String
    @Binding var key_pin_storage: String
    @Binding var unlockPinScreen: Bool
    @Binding var wrongPinScreen: Bool
    @Binding var timingBool: Bool
    @StateObject var state: State
    @Binding var closeScreen: Bool
    
    var body: some View {
      
            Button(action: {
                setPin()
            }) {
                
                VStack(spacing:0){
                    if value.count > 1 {
                        Image(systemName: "delete.left")
                            .font(Font.system(size: 30, weight: .medium, design: .default))
                            .foregroundColor(.red)
                    } else {
                        Text(value)
                            .font(Font.custom("CircularStd-Bold", size: 32))
                            .foregroundColor(.foregroundColorSchemeApp)
                    }
                }
                
            }
    }
    
    func setPin() {
        withAnimation {
            if value.count > 1 {
                if pin.count != 0 {
                    pin.removeLast()
                }
            } else {
                if pin.count != 4 {
                    pin.append(value)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            if pin.count == 4 {
//                                if state.isPinAvailable == nil {
                                    if pin == key_pin_storage {
                                        unlockPinScreen.toggle()
                                        closeScreen = false
                                    } else {
                                        wrongPinScreen = true
                                        timingBool = true
                                        pin.removeAll()
                                    }
//                                } else {
//                                    pin.removeAll()
//                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct PinScreenAppView_Previews: PreviewProvider {
    static var previews: some View {
        PinScreenAppView(state: State(), locked: .constant(true))
    }
}
