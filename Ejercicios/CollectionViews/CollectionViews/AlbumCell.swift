//
//  AlbumCell.swift
//  CollectionViews
//
//  Created by d182_Sergio_A on 21/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell{

    
    var album: Album?{
        didSet{
            if let name = album?.name{
                titleLable.text = name
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cover1")
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "Queen: Bohemian Rhapsody"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let categoryLable: UILabel = {
        let label = UILabel()
        label.text = "Rock"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    func setupLayout(){
        addSubview(imageView)
        addSubview(titleLable)
        addSubview(categoryLable)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        titleLable.frame = CGRect(x: 0, y: frame.width, width: frame.width, height: 40)
        categoryLable.frame = CGRect(x: 0, y: frame.width+40, width: frame.width, height: 40)
    }
}
