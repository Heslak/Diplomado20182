//
//  fishService.swift
//  plasticFishes
//
//  Created by d182_Sergio_A on 06/04/18.
//  Copyright © 2018 Seedvi. All rights reserved.
//

import Foundation

class FishService{
    let baseURL = URL(string: "https://plasticfishes.herokuapp.com")!
    let session = URLSession.shared
    
    
    static let shared = FishService()
    func all(){
        let url = baseURL.appendingPathComponent("/api/fishes")
        print(url)
    }
}
