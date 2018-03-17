//
//  Client.swift
//  Automotion
//
//  Created by d182_Sergio_A on 16/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

struct Client {
    let firstName: String?
    let lastName: String?
    let email: String
    var gender: Bool?
    var image: UIImage? {
        if gender ?? true  {
            return UIImage(named: "literature")
        }else{
            return UIImage(named: "user_male")
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
