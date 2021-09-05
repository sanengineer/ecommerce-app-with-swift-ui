//
//  ViewCustom.swift
//  CoffeeShopAppWithSwiftUI
//
//  Created by San Engineer on 06/09/21.
//

import SwiftUI

struct RoundedCornersSpecific: View {
    var color: Color = .green
    var topRight: CGFloat = 0.0
    var bottomRight: CGFloat = 0.0
    var bottomLeft: CGFloat = 0.0
    var topLeft: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let _width = geometry.size.width
                let _height = geometry.size.height
                
                let _topRight = min(min(self.topRight,  _height/2), _width/2)
                let _bottomRight = min(min(self.bottomRight, _height/2), _width/2)
                let _bottomLeft = min(min(self.bottomLeft, _height/2), _width/2)
                let _topLeft = min(min(self.topLeft, _height/2), _width/2)
                
                path.move(to: CGPoint(x: _width/2.0, y: 0))
                
                path.addLine(to: CGPoint(x: _width - _topRight, y: 0))
                path.addArc(center: CGPoint(x: _width - _topRight, y: _topRight), radius: _topRight, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                
                path.addLine(to: CGPoint(x: _width, y: _height - _bottomRight))
                path.addArc(center: CGPoint(x: _width - _bottomRight, y: _height - _bottomRight), radius: _bottomRight, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                
                path.addLine(to: CGPoint(x: _bottomLeft, y: _height))
                path.addArc(center: CGPoint(x: _bottomLeft, y: _height - _bottomLeft), radius: _bottomLeft, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                
                path.addLine(to: CGPoint(x: 0, y: _topLeft))
                path.addArc(center: CGPoint(x: _topLeft, y: _topLeft), radius: _topLeft, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}
