//
//  HexagonShape.swift
//  Pascal's Triangle
//
//  Created by Marina on 28/05/2022.
//

import Foundation
import UIKit

class HexagonShapeView:UIView{
    var sideLength:CGFloat = 100
    var borderWidth:CGFloat = 5
    var borderColor:UIColor = .black
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawHexa()
    }
    func drawHexa(){
        let layer =  CAShapeLayer()
        let path = UIBezierPath()
        let minHeight = sideLength / 2
        let midPoint = CGPoint(x:self.frame.midX, y:self.frame.midY)
        let firstPoint = CGPoint(x: midPoint.x - sideLength, y: midPoint.y)
        path.move(to: firstPoint)
        var currentPoint = path.move(from: firstPoint, by: CGPoint(x: 0, y: -minHeight))
        
        currentPoint = path.move(from: currentPoint, by: CGPoint(x: sideLength, y: -minHeight))
        
        currentPoint = path.move(from: currentPoint, by: CGPoint(x: sideLength, y: minHeight))
        
        currentPoint = path.move(from: currentPoint, by: CGPoint(x: 0, y: sideLength))
        
        currentPoint = path.move(from: currentPoint, by: CGPoint(x: -sideLength, y: minHeight))
        
        _ = path.move(from: currentPoint, by: CGPoint(x: -sideLength, y: -minHeight))
        
        path.close()
        let color = borderColor
        color.set()
        path.lineWidth = CGFloat(borderWidth)
        path.stroke()

        // add shape to the view
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
    }
    
    
}

extension UIBezierPath{
     func move(from point:CGPoint, by distance:CGPoint) -> CGPoint{
         let newPoint = CGPoint(x: point.x + distance.x, y: point.y + distance.y)
         self.addLine(to: newPoint)
         return newPoint
    }
}
