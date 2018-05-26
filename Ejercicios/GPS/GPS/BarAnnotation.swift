//
//  Bar.swift
//  GPS
//
//  Created by d182_Sergio_A on 25/05/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import Foundation
import MapKit

class BarAnnotation: NSObject,MKAnnotation{
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let locationName: String
    let theme: String
    
    init(title: String,locationName: String, theme: String,coordinate: CLLocationCoordinate2D){
        self.title=title
        self.locationName = locationName
        self.theme = theme
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String?{
        return locationName
    }
}
