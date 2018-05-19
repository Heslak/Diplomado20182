//
//  LoadingView.swift
//  Animations
//
//  Created by d182_Sergio_A on 18/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

//import Foundation
import UIKit

class LoadingView: UIView{

    
    lazy var circle: CAShapeLayer={
        let layer = circleShape(at: self.center,fillColor: UIColor(named: "SILVER_LAKE_BLUE")!,strokeColor:.clear)
        return layer
    }()
    
    lazy var strokeLayer: CAShapeLayer={
        let layer = circleShape(at: self.center,fillColor: .clear,strokeColor:UIColor(named: "TURQUOISE")!,radius: 130)
        layer.strokeEnd = 0
        layer.transform = CATransform3DMakeRotation(-CGFloat.pi/2.0, 0, 0, 1)
        return layer
    }()
    
    lazy var pulseLayer: CAShapeLayer = {
        let layer = circleShape(at: self.center,fillColor: UIColor(named: "BLUE_JEANS")!,strokeColor:UIColor(named: "DARK_CERULEAN")!)
        return layer
    }()
    
    let pulseAnimation: CAAnimationGroup={
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue=0.8
        scaleAnimation.toValue = 2.5
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue=0.8
        opacityAnimation.toValue=0
        
        let pulseAnimation = CAAnimationGroup()
        pulseAnimation.animations = [scaleAnimation,opacityAnimation]
        pulseAnimation.duration = 0.6
        pulseAnimation.repeatCount = Float.infinity
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return pulseAnimation
    }()
    let progressAnimation : CABasicAnimation = {
        let animation =  CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 5
        return animation
    }()
    
    let strokeFinish : CABasicAnimation = {
        let animation =  CABasicAnimation(keyPath: "strokeEnd")
        animation.timeOffset = 10000
        animation.fromValue = 1
        animation.toValue = 1
        animation.duration = 5
    
        return animation
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayers()
    }
    
    func setupLayers() {
        backgroundColor = .black
        self.layer.addSublayer(pulseLayer)
        self.layer.addSublayer(strokeLayer)
        self.layer.addSublayer(circle)
        pulseLayer.add(pulseAnimation,forKey: "pulseAnimation")
    }
    
    private func circleShape(at center: CGPoint,
                             fillColor: UIColor,
                             strokeColor: UIColor,
                             radius: CGFloat = 120,
                             strokeWidth: CGFloat = 20) -> CAShapeLayer {
        let shape = CAShapeLayer()
        let circle = UIBezierPath(arcCenter: .zero,
                                  radius: radius,
                                  startAngle: 0,
                                  endAngle: 2*CGFloat.pi,
                                  clockwise: true)
        shape.path = circle.cgPath
        shape.fillColor = fillColor.cgColor
        shape.strokeColor = strokeColor.cgColor
        shape.lineWidth = strokeWidth
        shape.lineCap = kCALineCapRound
        shape.position = center
        return shape
    }
    
    func animatePulse(){
        //pulseLayer.add(pulseAnimation,forKey: "pulseAnimation")
        //UIView.animate(withDuration: 100, animations: { () -> Void in
          //  self.strokeLayer.add(self.progressAnimation, forKey: "progressBarAnimation")
            //self.strokeLayer.a
            //self.strokeLayer.add(progressAnimation, forKey: "progressBarAnimation")
        UIView.animate(withDuration: 5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.strokeLayer.add(self.progressAnimation, forKey: "progressBarAnimation")
        }) { (finish) in
            print("Hola")
        }
        
    }
}
