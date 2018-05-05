//
//  LoginViewController.swift
//  Firebase
//
//  Created by d182_Sergio_A on 05/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Salir", style: .plain, target: self, action: #selector(logoutUser))
    }
    
    @objc func logoutUser(){
        do{
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        }catch _{
            print("Pues error")
        }
    }
}
