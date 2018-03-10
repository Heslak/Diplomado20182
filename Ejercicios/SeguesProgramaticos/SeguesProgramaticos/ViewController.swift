//
//  ViewController.swift
//  SeguesProgramaticos
//
//  Created by d182_Sergio_A on 09/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var EnableSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueButtonTapped(_ sender: UIButton) {
        if EnableSwitch.isOn {
            performSegue(withIdentifier: "Blue", sender: nil)
        }
    }
    
    @IBAction func lilaButtonTapped(_ sender: UIButton) {
        if EnableSwitch.isOn {
            performSegue(withIdentifier: "Lila", sender: nil)
        }
    }
    
    @IBAction func KeyButtton(_ sender: UIButton) {
        TextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

