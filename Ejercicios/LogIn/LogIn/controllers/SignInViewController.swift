//
//  SigIngViewController.swift
//  LogIn
//
//  Created by d182_Sergio_A on 20/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var repeatpasstextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Registro(_ sender: UIButton) {
        let name = nameTextField.text!
        let mail = mailTextField.text!
        let pass = passTextField.text!
        let repeatpass = repeatpasstextField.text!
        if pass == repeatpass {
            signIn(name: name,email: mail,password:pass)
        }
    }
    
    func signIn(name:String,email:String,password:String){
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ioslab.herokuapp.com"
        components.path = "/sign_up"
        var req = URLRequest(url: components.url!)
        req.httpMethod = "POST"
        let data : [String:String] = ["name":name,"email":email,"password":password]
        let User = ["user":data]
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
        print("Hola")
        let task = session.dataTask(with: req){ (data,response,error) in
            guard error == nil else {
                print("Error en el request ",error!)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("No se pudo obtener el response")
                return
            }
            print(response.statusCode)
            switch response.statusCode {
                case 201:
                    self.parseSignIn(data, completion: { SignIn -> Void in
                        print(SignIn.name)
                    })
                default:
                    break
            }
        }
        
        task.resume()
    }
    
    func parseSignIn(_ data: Data? ,completion: @escaping ((SignIn) -> Void)){
        guard let data = data else {
            print("Error al transformar los datos")
            return
        }
        let decoder =  JSONDecoder()
        print("Adios")
        do{
            //decoder.keyDecodingStrategy = .convertFromSnakeCase
            let json = try decoder.decode(SignIn.self, from: data)
            completion(json)
        }catch let err {
            print("Parsing Error \(err)")
        }
    }
}
