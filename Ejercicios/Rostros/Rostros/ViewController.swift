//
//  ViewController.swift
//  Rostros
//
//  Created by d182_Sergio_A on 02/06/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var selectedImage: UIImage!
    
    let faceImage : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "default")
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        
        return iv
    }()
    
    let boton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Detectar rostros", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(detectFace), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectImage))
        setupLayout()
    }
    
    func setupLayout(){
        view.addSubview(faceImage)
        view.addSubview(boton)
        
        faceImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        faceImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        faceImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        boton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        boton.topAnchor.constraint(equalTo: faceImage.bottomAnchor, constant: 20).isActive = true
        boton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        boton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func detectFace(){
        let detectFaceView = DetectFaceViewController()
        detectFaceView.selectImage = selectedImage
        navigationController?.pushViewController(detectFaceView, animated: true)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker,animated: true,completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagen = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            faceImage.image = imagen
            selectedImage = imagen
            dismiss(animated: true, completion: nil)
        }
    }


}

