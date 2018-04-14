//
//  KeyValueStore.swift
//  LocalSettings
//
//  Created by d182_Sergio_A on 14/04/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

class SecretStore {
    static let shared = SecretStore()
    
    var fileURL: URL = {
        var doc: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        doc.appendPathComponent("mx.unam.localsettings.archive")
        return doc
    }()
    
    private var dict: [String:String] = [String:String]()
    init() {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: fileURL.path) as? [String:String]{
            dict = data
        }
    }
    
    func set(_ value: String, forKey key: String) -> String?{
        dict[key] = value
        return dict[key]
    }
    
    func get(forKey key: String) -> String?{
        return dict[key]
    }
    func save(){
        NSKeyedArchiver.archiveRootObject(self.dict, toFile: fileURL.path)
    }
    
    func saveBackground(){
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard that = self else { print("Oups! I did it again.")
                return}
            self.save()
        }
    }
}
