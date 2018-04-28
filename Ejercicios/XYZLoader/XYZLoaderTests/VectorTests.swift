//
//  XYZLoaderTests.swift
//  XYZLoaderTests
//
//  Created by d182_Sergio_A on 28/04/18.
//  Copyright © 2018 SEEDVI. All rights reserved.
//

import XCTest
@testable import XYZLoader

class VectorTests: XCTestCase {
    func testVector() {
        let vec = Vector(x:1, y:2, z:3)
        XCTAssertNotNil(vec)
        XCTAssertEqual(Float(1), vec.x)
        XCTAssertEqual(Float(2), vec.y)
        XCTAssertEqual(Float(3), vec.z)
    }
    
    func testEquatabl(){
        let vec = Vector(x:1, y:2, z:3)
        XCTAssertEqual(vec, vec)
    }
    
    func testAddition(){
        let vecA = Vector(x:1, y:2, z:3)
        let vecB = Vector(x:3, y:2, z:1)
        let expected = Vector(x:4, y:4, z:4)
        XCTAssertEqual(expected, vecA + vecB)
    }
    
    
    func testDiv(){
        let vec = Vector(x:3, y:3, z:3)
        let expected = Vector(x:1.5, y:1.5, z:1.5)
        XCTAssertEqual(expected, vec/2.0)
    }
}
