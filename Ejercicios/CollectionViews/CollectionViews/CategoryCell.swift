//
//  CategoryCell.swift
//  CollectionViews
//
//  Created by d182_Sergio_A on 21/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    let albumCellId = "albumCell"
    
    var albums:[Album]?
    
    var albumCategory: Category?{
        didSet{
            if let name = albumCategory?.name{
                categoryLable.text = name
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
    
    let AlbumCollectionView : UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    var categoryLable: UILabel = {
        let label = UILabel()
        label.text = "Rock"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout(){
        backgroundColor = UIColor.clear
        addSubview(categoryLable)
        addSubview(AlbumCollectionView)
        
        AlbumCollectionView.dataSource = self
        AlbumCollectionView.delegate = self
        
        AlbumCollectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumCellId)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryLable]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v1]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":AlbumCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":categoryLable,"v1":AlbumCollectionView]))
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumCellId, for: indexPath) as! AlbumCell
        // Configure the cell
        cell.backgroundColor =  UIColor.clear
        //cell.album = albumCategory?.albums![indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
}
