//
//  ViewController.swift
//  Animations
//
//  Created by d182_Sergio_A on 18/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    lazy var loadingView: LoadingView = {
        let view = LoadingView(frame: self.view.frame)
        return view
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.loadingView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func onTap(){
        
        print("taping...")
        loadingView.animatePulse()
    }
    
    


}

