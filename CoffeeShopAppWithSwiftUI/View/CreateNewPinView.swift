//
//  CreateNewPinView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 07/09/21.
//

import SwiftUI

struct CreateNewPinView: View {
    
    @StateObject var state: State
    @AppStorage("pin_screen") var key_pin_storage = "2222"
    @Binding var unlockScreen: Bool
 
    var timer = Timer.publish(every: 1.0, on: .current, in: .default).autoconnect()
    
    var body: some View {
        VStack(spacing:0){
            NavigationBar(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton: false, pathRouterLeftBar: "/profile/security/pin_screen", showTitle: false)
            ZStack{
               
//                if state.wrongPinScreen == true {
//                    Text("Wrong Pin")
//                        .font(Font.custom("CircularStd-Book", size: 14))
//                        .foregroundColor(.blue)
//                } else {
//                    EmptyView()
//                }
                
                VStack(spacing: UIScreen.screenHeight / 11){
                    VStack(spacing: UIScreen.screenHeight / 11){
                        Text("Enter Your Pin")
                            .font(Font.custom("CircularStd-Bold", size: 18))
                        
                        HStack(spacing: 20){
                            ForEach(0..<4, id:\.self){ index in
                                CirclePinScreen(index: index, pinScreen: $state.pinScreen)
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
                                    
                                                print("\(state.remaining)")
                                                self.state.remaining -= 1.0
                                                
                                                if self.state.remaining == -1.0 {
                                                    self.state.remaining = 1.0
                                                    stopTimer()
                                                }
                                                
                                                
                                                if state.appearWrong == true {
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
                        let __data = state.getPin()

                        print("\(__data)")
                        
                        if state.appearWrong == true {
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
                    
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 40){
                        ForEach(1...9, id:\.self){ index in
                            KeyPadPinScreen(value: "\(index)", pin: $state.pinScreen, key_pin_storage: $key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, state: state)
                        }
                        
                        KeyPadPinScreen(value: "delete.fill", pin: $state.pinScreen, key_pin_storage: $key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, state: state)
                        
                        KeyPadPinScreen(value: "0", pin: $state.pinScreen, key_pin_storage: $key_pin_storage, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, state: state)
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
    
    func stopTimer(){
        timer.upstream.connect().cancel()
        state.wrongPinScreen = false
    }
}


struct CirclePinScreen: View {
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
        .transition(.scale(scale: 0, anchor: .center))
         
    }
}


struct KeyPadPinScreen: View {
    
    var value: String
    @Binding var pin: String
    @Binding var key_pin_storage: String
    @Binding var unlockPinScreen: Bool
    @Binding var wrongPinScreen: Bool
    @Binding var timingBool: Bool
    @StateObject var state: State
    
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
//                .padding()
                
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
                                state.setPin()
                                
//                                if pin == key_pin_storage {
//                                    unlockPinScreen.toggle()
//                                } else {
//                                    wrongPinScreen = true
//                                    timingBool = true
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


struct CreateNewPinView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPinView(state: State(), unlockScreen: .constant(true))
    }
}
