//
//  User.swift
//  UniversalTableView
//
//  Created by d182_Sergio_A on 17/03/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import UIKit

struct User {
    let firstName : String?
    let lastName : String?
    let email : String
    let citizenship : String
    var gender: Bool?
    var image: UIImage? {
        if gender ?? true  {
            return UIImage(named: "moon_symbol")
        }else{
            return UIImage(named: "sun")
        }
    }
    var fullName : String {
        var out : String = "\(firstName ?? "") \(lastName ?? "")"
        if out.isEmpty {
            out = "No name"
        }
        return out
    }
    
}
