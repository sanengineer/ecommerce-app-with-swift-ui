//
//  TabBarView.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 29/08/21.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    
    @StateObject var state : State

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
                                .frame(width: 24, height: 24)

                            Text(self.state.tabCollection[int].tabName)
                                .font(Font.system(size: 14, weight: self.state.selectionTab == int ? .heavy : .regular, design: .default))
                                .foregroundColor(.black)
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
            .background(Color.white)
            .border(width: 1, edges:[.top], color: Color.darkLightColor, opacity: 1.0)
            
       
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(state: State())
    }
}
