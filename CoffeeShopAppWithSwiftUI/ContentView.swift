//
//  ContentView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import SwiftUI


struct ContentView: View {

    @StateObject var state : State

    var body: some View {
        RootView(state: State())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: State())
    }
}
