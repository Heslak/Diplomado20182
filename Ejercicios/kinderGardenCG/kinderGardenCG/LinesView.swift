//
//  LinesView.swift
//  kinderGardenCG
//
//  Created by d182_Jorge_M on 16/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class LinesView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        UIColor.blue.setStroke()
//        context!.setLineWidth(5)
//        context!.move(to: CGPoint(x: 0, y: 0))
//        context!.addLine(to: CGPoint(x: 100, y: 100))
//        context!.strokePath()
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: 0, y: 0))
        aPath.addLine(to: CGPoint(x: 100, y: 100))
        aPath.close()
        UIColor.blue.set()
        aPath.stroke()
    }
 

}
