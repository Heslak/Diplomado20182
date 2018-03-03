//
//  ViewController.swift
//  SimpleForm
//
//  Created by d182_Sergio_A on 02/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var colores = ["Azureish White","Baby Blue Eyes","Green-Blue","Maya Blue","Plum Purple","Purple Navy"]
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var cuteElephant: UILabel!
    @IBOutlet var varview: UIView!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var buttonDelete: UIButton!
    @IBOutlet var buttonEdit: UIButton!
    @IBOutlet var buttonChangeColor: UIButton!
    
    @IBAction func changeColor(_ sender: UIButton) {
        
        
        let randomNum:Int = Int (arc4random_uniform(UInt32(6)))
        
        //let cambio = colores.sorted({ $0.len < randomNum })
        textLabel.textColor=UIColor(named: colores[randomNum])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

