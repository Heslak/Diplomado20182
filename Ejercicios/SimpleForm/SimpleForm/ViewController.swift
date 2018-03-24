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
        

        let cambio = colores.sorted { (uno:String, dos:String) -> Bool in
                uno.count%6 < randomNum

        }
        textLabel.textColor=UIColor(named: cambio[0])
        cuteElephant.textColor=UIColor(named: cambio[1])
        varview.backgroundColor=UIColor(named: cambio[2])
        buttonSave.backgroundColor=UIColor(named: cambio[3])
        buttonSave.tintColor=UIColor(named: cambio[4])
        buttonDelete.backgroundColor=UIColor(named: cambio[4])
        buttonDelete.tintColor=UIColor(named: cambio[5])
        buttonEdit.backgroundColor=UIColor(named: cambio[5])
        buttonEdit.tintColor=UIColor(named: cambio[0])
        buttonChangeColor.backgroundColor=UIColor(named: cambio[0])
        buttonChangeColor.tintColor=UIColor(named: cambio[1])
        
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

