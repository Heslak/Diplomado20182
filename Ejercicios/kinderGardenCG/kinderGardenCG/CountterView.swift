//
//  CounterButton.swift
//  kinderGardenCG
//
//  Created by d182_Sergio_A on 16/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

@IBDesignable
class CountterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet{
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var countterColor: UIColor = UIColor.orange
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width/2,y: bounds.height/2)
        let radius : CGFloat = max(bounds.width,bounds.height)
        let startAngle : CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - 76/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = 76
        countterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 4, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - 76 + 4, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        outlinePath.close()
        UIColor.blue.setStroke()
        outlinePath.lineWidth = 8
        outlinePath.stroke()
    }
    
    

}
