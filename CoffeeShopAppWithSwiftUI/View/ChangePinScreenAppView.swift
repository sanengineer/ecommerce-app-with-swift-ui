//
//  ChangePinScreenAppView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 12/09/21.
//

import SwiftUI

struct ChangePinScreenAppView: View {
    
    @StateObject var state: State
//    @AppStorage("pin_screen") var key_pin_storage = "2222"
    
    @Binding var unlockScreen: Bool
 
    var timer = Timer.publish(every: 1.0, on: .current, in: .default).autoconnect()
    
    var body: some View {
        
            mainContent
    
    }
    
    var mainContent: some View {
        VStack(spacing:0){
            NavigationBar(backgroundColor: .backgroundColorSchemeApp, color: .foregroundColorSchemeApp, hiddenLeftBarButton:  state.isForwardToCreateNewPin, pathRouterLeftBar: "/profile/security/pin_screen", showTitle: false)
            ZStack{
                VStack(spacing: UIScreen.screenHeight / 11){
                    VStack(spacing: UIScreen.screenHeight / 11){
                        
                        if state.isForwardToCreateNewPin == false {
                            Text("Enter Your Pin")
                                .font(Font.custom("CircularStd-Bold", size: 18))
                            
                        } else {
                            Text(state.isForwardVerifiedNewPin ? "Enter New Pin Again \nTo Verified" : "Enter New Pin")
                                .font(Font.custom("CircularStd-Bold", size: 18))
                                .foregroundColor(.heroColor)
                        }
                        
                        
                        HStack(spacing: 20){
                            ForEach(0..<4, id:\.self){ index in
                                CirclePinScreen_ChangePinScreenAppView(index: index, pinScreen: state.isForwardToCreateNewPin ? state.isForwardVerifiedNewPin ? $state.verifiedNewPinScreenApp :  $state.newPinScreenApp : $state.pinScreen)
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
                        print("TESTTTTTTT",state.newPinScreenApp)
                        
                        state.key_pin_storage = __data
                        
                        if state.isForwardToCreateNewPin == true {
                            print(true)
                        } else {
                            print(false)
                        }
                        
                        if state.wrongPinScreen == true {
                            print("WRONG PRINT SCREEN: \(true)")
                        } else {
                            print("WRONG PRINT SCREEN: \(false)")
                        }
                        
                        print("NEW PIN", state.newPinScreenApp)
                    }
                    
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 40){
                        ForEach(1...9, id:\.self){ index in
                            KeyPadPinScreen_ChangePinScreenAppView(value: "\(index)", pin: $state.pinScreen, key_pin_storage: $state.isPinAvailable, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, newPin: $state.newPinScreenApp, verifiedNewPin: $state.verifiedNewPinScreenApp, state: state)
                        }
                        
                        KeyPadPinScreen_ChangePinScreenAppView(value: "delete.fill", pin: $state.pinScreen, key_pin_storage: $state.isPinAvailable, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, newPin: $state.newPinScreenApp, verifiedNewPin: $state.verifiedNewPinScreenApp, state: state)
                        
                        KeyPadPinScreen_ChangePinScreenAppView(value: "0", pin: $state.pinScreen, key_pin_storage: $state.isPinAvailable, unlockPinScreen: $state.isLockScreen, wrongPinScreen: $state.wrongPinScreen, timingBool: $state.appearWrong, newPin: $state.newPinScreenApp, verifiedNewPin: $state.verifiedNewPinScreenApp, state: state)
                    }
                    
                }
            }
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .top)
        .background(Color.backgroundColorSchemeApp)
        .ignoresSafeArea(.all)
    }
    
    var success_popup: some View {
        SuccessChangePinView(isVerified: $state.successChangePin, isDarkScheme: $state.bool)
    }
    
    func stopTimer(){
        timer.upstream.connect().cancel()
        state.wrongPinScreen = false
    }
}


struct CirclePinScreen_ChangePinScreenAppView: View {
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
                        .fill(Color.red)
                        .frame(width: 14, height: 14)
                        
                }
                
            }
        .onAppear{
            print("Check", pinScreen.count, "index:", index)
        }
        .transition(.scale(scale: 0, anchor: .center))
         
    }
}


struct KeyPadPinScreen_ChangePinScreenAppView: View {
    
    var value: String
    @Binding var pin: String
    @Binding var key_pin_storage: String?
    @Binding var unlockPinScreen: Bool
    @Binding var wrongPinScreen: Bool
    @Binding var timingBool: Bool
    @Binding var newPin: String
    @Binding var verifiedNewPin: String
    @StateObject var state: State
    
    var body: some View {
      
            Button(action: {
                if state.isForwardToCreateNewPin == true{
                    setNewPin()
                    if state.isForwardVerifiedNewPin == true {
                        setVerifiedNewPin()
                    }
                } else {
                    setPin()
                }
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
                               
                                if pin == key_pin_storage {
                                    print("PIN", pin)
                                    state.isForwardToCreateNewPin = true
                                    
                                    if state.isForwardToCreateNewPin == true {
                                        pin.removeAll()
                                        wrongPinScreen = false
                                        timingBool = false
                                    }
                                    
                                } else {
                                    wrongPinScreen = true
                                    timingBool = true
                                    pin.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    func setNewPin() {
        withAnimation {
            if value.count > 1 {
                if newPin.count != 0 {
                    newPin.removeLast()
                }
            } else {
                if newPin.count != 4 {
                    newPin.append(value)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            
                            if newPin.count == 4 {
                                    print("NEW PIN", newPin)
                                    state.isForwardVerifiedNewPin = true
                                    state.newPinScreenApp = self.newPin
                                    
                                    if state.isForwardVerifiedNewPin == true {
                                        
                                        if  state.newPinScreenApp == newPin {
//                                            newPin.removeAll()
                                            wrongPinScreen = false
                                            timingBool = false
                                            print("state.newPinScreenApp == newPin:",true)
                                        }
                                        else {
                                            wrongPinScreen = true
                                            timingBool = true
                                            pin.removeAll()
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
    func setVerifiedNewPin() {
        withAnimation {
            if value.count > 1 {
                if verifiedNewPin.count != 0 {
                    verifiedNewPin.removeLast()
                }
            } else {
                if verifiedNewPin.count != 4 {
                    verifiedNewPin.append(value)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            
                            if verifiedNewPin.count == 4 {
                                if verifiedNewPin == state.newPinScreenApp {
                                    print("STATE NEW PIN", state.newPinScreenApp)
                                    print("VERIFIED NEW PIN", verifiedNewPin)
                                    state.successChangePin = true
                                    
                                } else {
                                    print("STATE NEW PIN", state.newPinScreenApp)
                                    wrongPinScreen = true
                                    timingBool = true
                                    verifiedNewPin.removeAll()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct ChangePinScreenAppView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePinScreenAppView(state: State(), unlockScreen: .constant(true))
    }
}
