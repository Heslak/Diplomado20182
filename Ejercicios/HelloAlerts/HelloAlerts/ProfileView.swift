//
//  ProfileView.swift
//  HelloAlerts
//
//  Created by d182_Sergio_A on 23/03/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    let imageView: UIImageView = {
        let img: UIImageView = UIImageView()
        img.image = UIImage.init(named: "Elephant")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let labelView: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.font =  UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.text = "The Elephant"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let textView: UITextView = {
        let txt: UITextView = UITextView()
        txt.font =  UIFont.systemFont(ofSize: 14, weight: .bold)
        txt.text = "Elephants are large mammals of the family Elephantidae and the order Proboscidea. Three species are currently recognised: the African bush elephant (Loxodonta africana), the African forest elephant (L. cyclotis), and the Asian elephant (Elephas maximus). Elephants are scattered throughout sub-Saharan Africa, South Asia, and Southeast Asia. Elephantidae is the only surviving family of the order Proboscidea; other, now extinct, members of the order include deinotheres, gomphotheres, mammoths, and mastodons."
        txt.textAlignment = .justified
        txt.textColor = .white
        txt.backgroundColor = UIColor.yankeesBlue
        txt.isEditable = false
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    func setupLayout(){
        
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 300)])
        
        self.addSubview(labelView)
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            labelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            labelView.heightAnchor.constraint(equalToConstant: 45 )])
        
        self.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)])
    }
}
