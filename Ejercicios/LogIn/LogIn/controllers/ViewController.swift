//
//  ViewController.swift
//  LogIn
//
//  Created by d182_Sergio_A on 20/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextFlied: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func LogIng(_ sender: UIButton) {
        LogIn()
    }

    func LogIn(){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ioslab.herokuapp.com"
        components.path = "/auth"
        var req = URLRequest(url: components.url!)
        req.httpMethod = "POST"
        var User : [String:Any] = ["email":"","password":""]
        User.updateValue(userTextFlied.text ?? "", forKey: "email")
        User.updateValue(passTextField.text ?? "", forKey: "password")
        let json : Data
        do{
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            json = try JSONSerialization.data(withJSONObject: User, options: [])
            req.httpBody = json
        }catch{
            print("Cannot create the json",error)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: req){ (data,response,error) in
            guard error == nil else {
                print("Error en el request ",error!)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("No se pudo obtener el response")
                return
            }
            guard let unwrappedData = data else {
                print("Error al recibir datos")
                return
            }
            do {
                print(unwrappedData)
                guard let datos = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:String] else{
                    print("No se pudo transformar los datos")
                    return
                }
                switch response.statusCode {
                    case 200:
                        print(datos["token"]!)
                    default:
                        break
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }

}

