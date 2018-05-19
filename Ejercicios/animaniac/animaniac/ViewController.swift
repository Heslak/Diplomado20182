//
//  ViewController.swift
//  animaniac
//
//  Created by d182_Sergio_A on 12/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var actionBtn1: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTapBtn1(_ sender: Any) {
//        UIView.animate(withDuration: 2, animations: {
//            self.actionBtn1.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
//            self.actionBtn1.transform = CGAffineTransform(scaleX: 2.0, y: 1.0)
//            self.actionBtn1.transform = CGAffineTransform(translationX: 1000, y: 0)
//            self.actionBtn1.backgroundColor = .blue
//        }, completion: {(succes) in
//            guard succes else { return }
//            UIView.animate(withDuration: 0.3, animations: {
//                self.actionBtn1.transform = CGAffineTransform.identity
//                self.actionBtn1.backgroundColor = .black
//            }, completion: nil)
//
//        })
        
        
        
//        let anima = CAKeyframeAnimation(keyPath: "backgroundColor")
//        let times : [NSNumber] = [0.0,0.25,0.5,0.75,1.0]
//        anima.keyTimes = times
//        anima.values = [UIColor.white.cgColor,
//                        UIColor.blue.cgColor,
//                        UIColor.yellow.cgColor,
//                        UIColor.gray.cgColor,
//                        UIColor.cyan.cgColor]
//        //anima.timingFunctions = CAMediaTimingFunction (name: kCAMediaTimingFunctionEaseOut)
//        anima.duration = 0.5
//        anima.repeatCount = 3.0
//        anima.autoreverses = true
//        self.view.layer.add(anima, forKey: "backgroundColor")
        
        let spring = CASpringAnimation(keyPath: "transform.scale.x")
        spring.fromValue = 1
        spring.toValue = 2
        spring.damping = 4
        spring.duration = 2
        spring.timeOffset = 0
        //spring.autoreverses = true
   
        let revert = CABasicAnimation(keyPath: "transform.scale.x")
        revert.fromValue = 2
        revert.toValue = 1
        revert.duration = 1
        revert.timeOffset = 2
        
        let group = CAAnimationGroup()
        group.animations = [spring,revert]
        group.duration = 3
        //self.view.layer.add(group,forKey: "springAndReverse")
        //self.view.layer.add(revert, forKey: "revert.spring.x")

        
    }
    

}

