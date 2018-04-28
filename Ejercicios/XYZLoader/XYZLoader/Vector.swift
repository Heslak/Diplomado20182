//
//  Vector.swift
//  XYZLoader
//
//  Created by d182_Sergio_A on 28/04/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import Foundation

struct Vector {
    let x: Float
    let y: Float
    let z: Float
    
    static func + (lhs: Vector, rhs: Vector) -> Vector{
       return Vector(x:lhs.x+rhs.x, y:lhs.y+rhs.y, z:lhs.z+rhs.z)
    }
    static func / (lhs: Vector, rhs: Float) -> Vector{
        return Vector(x:lhs.x/rhs, y:lhs.y/rhs, z:lhs.z/rhs)
    }
}

extension Vector: Equatable {
    static func == (lhs: Vector, rhs: Vector) -> Bool{
        return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
    }
}
