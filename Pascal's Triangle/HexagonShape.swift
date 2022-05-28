//
//  HexagonShape.swift
//  Pascal's Triangle
//
//  Created by Marina on 28/05/2022.
//

import Foundation
import UIKit

class HexagonShapeView:UIView{
    var sideLength:CGFloat = 50
    var elementText:String = "1"
    var borderWidth:CGFloat = 5
    var borderColor:UIColor = .black
    private var minHeight:CGFloat {
        return sideLength/2
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawHexa()
        drawElement()
    }

    private func drawHexa(){
        let layer =  CAShapeLayer()
        let path = UIBezierPath()
        let midPoint = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
        let firstPoint = CGPoint(x: midPoint.x - sideLength, y: midPoint.y)
        path.move(to: firstPoint)
        path.move(distance: CGPoint(x: 0, y: -minHeight))
        
        path.move(distance: CGPoint(x: sideLength, y: -minHeight))
        
        path.move(distance: CGPoint(x: sideLength, y: minHeight))
        
        path.move(distance: CGPoint(x: 0, y: sideLength))
        
        path.move(distance: CGPoint(x: -sideLength, y: minHeight))
        
        path.move(distance: CGPoint(x: -sideLength, y: -minHeight))
        
        path.move(distance: CGPoint(x: 0, y: -minHeight))
        let color = borderColor
        color.set()
        path.lineWidth = CGFloat(borderWidth)
        path.stroke()

        // add shape to the view
        layer.path = path.cgPath
        layer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(layer)
    }
    
    private func drawElement(){
        let label = UILabel()
        label.text = elementText
        label.font = .boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.center =  self.center

        self.addSubview(label)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //label.centerXAnchor =  self.centerXAnchor
        
    }
    
    
}

extension UIBezierPath{
     func move(distance:CGPoint){
         let newPoint = CGPoint(x: currentPoint.x + distance.x, y: currentPoint.y + distance.y)
         self.addLine(to: newPoint)
    }
}
