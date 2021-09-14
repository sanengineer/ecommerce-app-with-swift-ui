//
//  TabBarView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI
import SwiftUIRouter

struct TabBarView: View {
    
    @StateObject var state : State
    
    var textSize14: CGFloat = 12

    var body: some View {
        
    
            HStack{
                ForEach(0..<(self.state.tabCollection.count)){ int in
                    Button{
                        self.state.selectionTab = int
                    } label:{
                        VStack(alignment:.center,spacing:4){
                            Image((self.state.selectionTab) == int ? (self.state.tabCollection[int].tabIconActive) : (self.state.tabCollection[int].tabIconDeactive))
                                .antialiased(true)
                                .resizable()
                                .frame(width: 20, height: 20)

                            Text(self.state.tabCollection[int].tabName)
                                .font(.custom(self.state.selectionTab == int ? "CircularStd-Bold" : "CircularStd-Book" , size: textSize14))
                                .foregroundColor(.foregroundColorSchemeApp)
                        }
                    }
                    .frame(width: 60)
                    
                    if int != (state.tabCollection.endIndex - 1) {
                        Spacer()
                    }
                }
            }
           
            .padding(.horizontal, 30)
            .padding(.top, 12)
            .padding(.bottom, (self.state.ratio) == (self.state.aspectScreen) ? 6 : 30 )
            .background(Color.backgroundColorSchemeApp)
            .border(width: 1, edges:[.top], color: Color.borderColorSchemeApp, opacity: 1.0)
            
       
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(state: State())
    }
}
