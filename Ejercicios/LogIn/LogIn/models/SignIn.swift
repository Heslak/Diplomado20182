//
//  SignIn.swift
//  LogIn
//
//  Created by d182_Sergio_A on 20/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import Foundation

struct SignIn: Decodable {
    let id: Int
    let name: String
    let email: String
    let role: String
    let createdAt:String
    let updatedAt:String
    let token: String
    let avatarUrls: String?
    enum CodingKeys: String,CodingKey{
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case avatarUrls = "avatar_urls"
        case id,name,email,role,token
    }
}
