//
//  ViewController.swift
//  UploadImage
//
//  Created by d182_Sergio_A on 12/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var storageImage = #imageLiteral(resourceName: "Silvestre")
    var ref : DatabaseReference!
    
    let uploadImage : UIButton = {
        let btn = UIButton()        
        btn.setImage(#imageLiteral(resourceName: "Silvestre"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        return btn
    }()
    
    let uploadButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.setTitle("Subir foto", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        return btn
    }()
    
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        view.addSubview(uploadImage)
        view.addSubview(uploadButton)
        view.addSubview(myActivityIndicator)
        
        uploadImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uploadImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        uploadImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        uploadImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uploadButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        uploadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        uploadButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        myActivityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myActivityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        myActivityIndicator.translatesAutoresizingMaskIntoConstraints  = false
        //myActivityIndicator.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        ref = Database.database().reference()
    }

    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        self.present(picker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info ["UIImagePickerControllerOriginalImage"] as? UIImage{
            self.uploadImage.setImage(image, for: .normal)
            storageImage = image
            dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveImage () {
        let id = ref.childByAutoId().key
        self.myActivityIndicator.startAnimating()
        let storage = Storage.storage().reference()
        let nombreImagen = UUID()
        let directorio = storage.child("imagenes/\(nombreImagen)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        directorio.putData(UIImagePNGRepresentation(storageImage)!, metadata: metadata) { (data, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            print("Se subió la imagen")
            self.myActivityIndicator.stopAnimating()
        }
        let values = ["nombres":String(describing: directorio)]
        ref.child("imagenes").child(id).setValue(values)
    }

}

