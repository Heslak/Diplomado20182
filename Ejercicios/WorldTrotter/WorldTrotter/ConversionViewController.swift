//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by d182_Sergio_A on 16/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

//import Foundation

import UIKit
class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        //celsiusLabel.text = textField.text
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        print("Hola")
        textField.resignFirstResponder()
    }

}
