//
//  Models.swift
//  CollectionViews
//
//  Created by d182_Sergio_A on 21/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import Foundation

class Category: NSObject {
    var name: String?
    var albums: [Album]?
    static func samples() -> [Category]{
        
        let bestNewAlbums = Category()
        bestNewAlbums.name = "Los mejores"

        var albums = [Album]()
        
        let album = Album()
        album.category = "Rock"
        album.name = "Queen"
        album.image = "cover1"
        albums.append(album)
        
        bestNewAlbums.albums = albums
        
        let bestClassicAlbums = Category()
        bestClassicAlbums.name = "Música Clásica"
        
        return [bestNewAlbums,bestClassicAlbums]
    }
}


class Album: NSObject {
    var name: String?
    var category: String?
    var image: String?
}
