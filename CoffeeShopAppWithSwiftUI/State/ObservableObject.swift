//
//  ObservableObject.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 30/08/21.
//

import Foundation
import SwiftUI

struct tabItem: Codable {
    var path: String
    var tabIconDeactive: String
    var tabIconActive: String
    var tabName: String
}

struct profileItem: Codable {
    var icon: String
    var title: String
    var subtitle: String?
    var path: String
    
    init(icon: String, title: String, subtitle: String?, path: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.path = path
    }
}

class State: ObservableObject {
    @Published var iconName: String = "moon"
    @Published var labelThemeColor: String = "Dark"
    @Published var bool = false
    @Published var nextView: Bool = true
    @Published var selectionTab = 0
    @Published var tabCollection = [
        tabItem(path:"home",tabIconDeactive: "icon_home_rounded_deactive", tabIconActive: "icon_home_rounded_active", tabName: "Home"),
        tabItem(path: "/menu", tabIconDeactive: "icon_menu_rounded_deactive", tabIconActive: "icon_menu_rounded_active", tabName: "Menu"),
        tabItem(path: "/cart", tabIconDeactive: "icon_cart_rounded_deactive", tabIconActive: "icon_cart_rounded_active", tabName: "Cart"),
        tabItem(path: "/profile", tabIconDeactive: "icon_profile_rounded_deactive", tabIconActive: "icon_profile_rounded_active", tabName: "Profile")
    ]
    @Published var profileCollection = [
        profileItem(icon: "🧬", title: "Biodata", subtitle: "Fullname, gender, date birth", path: "/profile/biodata"),
        profileItem(icon: "🚢", title: "Shipping", subtitle: "Shipping address default or optional", path: "/profile/shipping"),
        profileItem(icon: "🔐", title: "Security", subtitle: "Pin app, and password account", path: "/profile/security"),
        profileItem(icon: "⚙️", title: "Settings", subtitle: "Theme, and set home color", path: "/profile/settings"),
        profileItem(icon: "🤝", title: "Help", subtitle: "Frequently ask and answer", path: "/profile/help"),
        profileItem(icon: "🔖", title: "Terms and Conditions", subtitle: nil, path: "/profile/terms_and_conditions")
        ]
    @Published var ratio: CGFloat = 16/9
    @Published var profile = profileItem.self
    @Published var aspectScreen: CGFloat = (UIScreen.screenHeight)/(UIScreen.screenWidth)
    @Published var fieldText = ""
    @Published var isfieldTextTapped = false
    @Published var isExpandNavBar = false
    @Published var initTextMultilineTextField = ""
    @Published var initHeightTextMultineTextField: CGFloat = 0
    @Published var heightKeyboard: CGFloat = 0
    @Published var bottomPaddingKeyboard: CGFloat = 0
    @Published var showModalHome: Bool =  false
    @Published var prevDragTranslationModal = CGSize.zero
    @Published var currentHeightModalHomeSetupOrder: CGFloat = (UIScreen.screenHeight/UIScreen.screenWidth) == (16/9) ? 250 : 280
    @Published var draggingModal = false
    @Published var defaultAddress: String = "Home Address One"
    @Published var showModalSetDefaultAddress: Bool = false
    @Published var showModalEditProfilePict: Bool = false
    @Published var pinScreen: String = ""
    @Published var pinScreenOnBoard: String = ""
    @Published var isLockScreen: Bool = true
    @Published var wrongPinScreen: Bool = false
    @Published var remaining = 1.0
    @Published var appearWrong:Bool = false
    @Published var key_pin_storage: String = ""
    @Published var activatePinScreen: Bool = false
    @Published var isForwardToCreateNewPin: Bool = false
    @Published var newPinScreenApp: String = ""
    @Published var verifiedNewPinScreenApp: String = ""
    @Published var isForwardVerifiedNewPin: Bool = false
    @Published var successChangePin: Bool = false
    
  
    
    //MARK: - Cart
    @Published var shohModalDelteItemOnCart: Bool = false
    // MARK: - Route Path
    @Published var profile_detail_path: String = "/menu/profile_detail"
    // MARK: - Func
    var defaults = UserDefaults.standard
    var _forKey = "PinScreenApp"
    
    var _forKeyActivatePinScreenApp = "ActivatePinScreenApp"
    var _forKeyThemeScheme = "ThemeScheme"
    
    func setThemeScheme(){
        defaults.set(bool, forKey: _forKeyThemeScheme)
    }
    
    func getThemeScheme() -> Bool {
        let data = defaults.bool(forKey: _forKeyThemeScheme)
        
        return data
    }
    
    func setActivatePin() {
        defaults.set(activatePinScreen, forKey: _forKeyActivatePinScreenApp)
    }
    
    func getActivatePin() -> Bool {
        let data = defaults.bool(forKey: _forKeyActivatePinScreenApp) 
        
        return data
    }
    
    @Published var statusActivatePinScreenNow : Bool = UserDefaults.standard.bool(forKey: "ActivatePinScreenApp")
    
    @Published var isPinAvailable: String? = UserDefaults.standard.value(forKey: "PinScreenApp") as? String
    
    func setPin(for pin:String) {
        defaults.set(pin, forKey: _forKey)
    }
    
    func getPin() -> String {
        guard let data = defaults.value(forKey: _forKey) else {
            return ""
        }
        
        return data as! String
    }
    
}
