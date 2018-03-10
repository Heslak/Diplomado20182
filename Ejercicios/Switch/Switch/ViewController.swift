//
//  ViewController.swift
//  Switch
//
//  Created by d182_Sergio_A on 09/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet var P_azul: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchActivated(_ sender: UISwitch) {
        if sender.isOn {
            print("The switch is on")
        }else{
            print("The switch is off")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        print(sender.value)
        
        P_azul.backgroundColor=UIColor(red: CGFloat(2/3<sender.value ? (sender.value-(2/3))*3  : 0.0), green: CGFloat(1/3<sender.value && 2/3>sender.value ? (sender.value-(1/3))*3  : 2/3<sender.value ? 1.0 : 0.0), blue: CGFloat(1/3>sender.value ? sender.value*3  : 1.0) , alpha: 1)
        
    }
    
    @IBAction func keyboardReturnKeytapped(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = TextField.text
    }
}

