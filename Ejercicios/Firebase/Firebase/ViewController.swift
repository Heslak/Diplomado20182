//
//  ViewController.swift
//  Firebase
//
//  Created by d182_Sergio_A on 05/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!
    
    let formContainterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        return view
    }()
    let registerButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(red: 232/255, green: 173/255, blue: 72/255, alpha: 1.0)
        btn.translatesAutoresizingMaskIntoConstraints =  false
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("Registro", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(loginRegister), for: .touchUpInside)
        return btn
    }()
    
    let emailTextfield: UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Correo electrónico"
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    let passwordTextfield: UITextField = {
        let tf =  UITextField()
        tf.placeholder = "Contraseña"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let formSegmentedControl : UISegmentedControl = {
        let sg = UISegmentedControl(items: ["Login","Register"])
        sg.translatesAutoresizingMaskIntoConstraints = false
        sg.selectedSegmentIndex = 1
        sg.tintColor = UIColor.white
        sg.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        return sg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(red: 30/255, green: 62/255, blue: 106/255, alpha: 1.0)
        setupLayout()
        
        ref = Database.database().reference()
    }
    
    func setupLayout(){
        view.addSubview(formContainterView)
        view.addSubview(registerButton)
        view.addSubview(formSegmentedControl)
        formContainterView.addSubview(emailTextfield)
        formContainterView.addSubview(passwordTextfield)
        
        formContainterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formContainterView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        formContainterView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        formContainterView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        //setup Button
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: formContainterView.bottomAnchor, constant: 15).isActive = true
        registerButton.widthAnchor.constraint(equalTo: formContainterView.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //emailTextField setup
        emailTextfield.leftAnchor.constraint(equalTo: formContainterView.leftAnchor,constant: 10).isActive = true
        emailTextfield.topAnchor.constraint(equalTo: formContainterView.topAnchor).isActive = true
        
        emailTextfield.widthAnchor.constraint(equalTo: formContainterView.widthAnchor).isActive = true
        emailTextfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //passwordTextFiel setup
        passwordTextfield.leftAnchor.constraint(equalTo: formContainterView.leftAnchor,constant: 10).isActive = true
        passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor).isActive = true
        
        passwordTextfield.widthAnchor.constraint(equalTo: formContainterView.widthAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //SegmentedControl setup
        
        formSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        formSegmentedControl.bottomAnchor.constraint(equalTo: formContainterView.topAnchor, constant: -15).isActive = true
        formSegmentedControl.widthAnchor.constraint(equalTo: formContainterView.widthAnchor).isActive = true
        
        formSegmentedControl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func segmentedChange(){
        let title = formSegmentedControl.titleForSegment(at: formSegmentedControl.selectedSegmentIndex)
        registerButton.setTitle(title, for: .normal)
    }
    
    @objc func loginRegister(){
        if formSegmentedControl.selectedSegmentIndex == 0{
            loginUser()
        } else {
            registerUser()
        }
    }
    func loginUser(){
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    print("Se inició sesión")
                    let lc = LoginViewController()
                    self.navigationController?.pushViewController(lc, animated: true)
                }else{
                    if let error = error?.localizedDescription{
                        print("Error al iniciar sesión por firebase",error)
                    }else{
                        print("Tú eres el error")
                    }
                }
            }
        }
    }
    
    func registerUser(){
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { (user,error) in
                if user != nil {
                    print("Se creo el usuario")
                    let values = ["name": email]
                    
                    guard let uid = user?.uid else {
                        return
                    }
                    
                    let userReference = self.ref.child("user").child(uid)
                    
                    userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
                        if error != nil {
                            print("Error al insertar datos")
                            return
                        }
                        print("Dato guardado en la DB",self)
                        
                        let login = LoginViewController()
                       // self.present(login,animated: true, completion: nil)
                        
                        self.navigationController?.pushViewController(login, animated: true)
                    })
                }else{
                    if let error = error?.localizedDescription{
                        print("Error al crear usuario por firebase",error)
                    }else{
                        print("Tú eres el error")
                    }
                }
            }
        }
    }

}

