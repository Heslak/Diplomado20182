//
//  DataLoader.swift
//  XYZLoader
//
//  Created by d182_Sergio_A on 28/04/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import Foundation


enum VectorSource {
    case res1
    case res2
    case res3
    case res4
    
    var resourceName: String {
        switch self {
        case .res1:
            return "bun_zipper_res1"
        case .res2:
            return "bun_zipper_res2"
        case .res3:
            return "bun_zipper_res3"
        case .res4:
            return "bun_zipper_res4"
        }
    }
    var url: URL? {
        return Bundle.main.url(forResource: resourceName, withExtension: "txt")
    }
    
    var content: String? {
        guard let url = url else{
            return nil
        }
        return try? String(contentsOf: url)
    }
}

class DataLoader{
    
    class func load(_ source: VectorSource) -> [Vector]{
        var output = [Vector]()
        guard let content = source.content else { return output }
        let lines = content.components(separatedBy: .newlines)
        for line in lines {
            let comps = line.components(separatedBy: .whitespaces)
            if comps.count < 3 { continue }
                let x = Float(comps[0]) ?? 0.0
                let y = Float(comps[1]) ?? 0.0
                let z = Float(comps[2]) ?? 0.0
                output.append(Vector(x: x,y: y,z: z))
        }
        return output
    }
    
    class func loadAsync (_ source: VectorSource, completion: @escaping ([Vector]) -> Void){
        DispatchQueue.global(qos: .background).async{
            let output = DataLoader.load(source)
            DispatchQueue.main.async {
                completion(output)
            }
        }
        
    }
}
