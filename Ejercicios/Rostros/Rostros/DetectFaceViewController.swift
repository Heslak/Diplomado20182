//
//  DetectFaceViewController.swift
//  Rostros
//
//  Created by d182_Sergio_A on 02/06/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import UIKit
import Vision
import ImageIO

class DetectFaceViewController: UIViewController {

    var selectImage: UIImage!
    
    let faceImage : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "default")
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        
        return iv
    }()
    
    let resultsLabel: UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont(name: "Arial", size: 30)
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        faceImage.image = selectImage
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let ciImage = selectImage.cgImage else {
            print("No se pudo crear el CIIMage")
            return
            
        }
        
        let orientation = CGImagePropertyOrientation(rawValue: UInt32(selectImage.imageOrientation.rawValue))
        
        let faceRequest = VNDetectFaceRectanglesRequest(completionHandler: handleFaces)
        
        let handler = VNImageRequestHandler(cgImage: ciImage, orientation: orientation!)
        
        DispatchQueue.global(qos: .userInteractive).async {
            do{
                try handler.perform([faceRequest])
            }catch{
                print("Error al manejar la petición")
            }
        }
    }
    
    func setupLayout(){
        view.addSubview(faceImage)
        view.addSubview(resultsLabel)
        
        faceImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        faceImage.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        faceImage.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        resultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsLabel.topAnchor.constraint(equalTo: faceImage.bottomAnchor, constant: 20).isActive = true
        resultsLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        resultsLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func handleFaces(request: VNRequest, error: Error?){
        guard let observations = request.results as? [VNFaceObservation] else {
            print("No se pudo hacer la solicitud")
            return
        }
        DispatchQueue.main.async {
            self.handleFaces(observations: observations)
        }
        
    }
    
    func handleFaces(observations: [VNFaceObservation]){
        resultsLabel.text = "Se detectaron \(observations.count) rostros"
        
        for face in observations{
            let box1 = face.boundingBox
            let box2 = faceImage.bounds
            
            let w = box1.size.width * box2.width
            let h = box1.size.height * box2.height
            
            let x = box1.origin.x * box2.width
            let y = abs((box1.origin.y * box2.height) - box2.height) - h
            
            let subView = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
            subView.layer.borderColor = UIColor.red.cgColor
            subView.layer.borderWidth = 3.0
            faceImage.addSubview(subView)
        }
    }
}
