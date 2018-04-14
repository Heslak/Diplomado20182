//
//  StringDictionary.swift
//  LocalSettings
//
//  Created by d182_Sergio_A on 14/04/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation
class DicWrapper{
    var dict: [String:String] = [String:String]()
}

class SecureStringValueStore: NSSecureCoding {
    var dict: [String:String] = [String:String]()
    static var supportsSecureCoding: Bool = true
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dict,forKey: "dict")
    }
    
    required init?(coder aDecoder: NSCoder) {
        //let decoded = aDecoder.decodeObject(of: DicWrapper.self ,forKey: "dict")
    }
    
}
