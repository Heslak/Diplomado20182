//
//  File.swift
//  Weather
//
//  Created by d182_Sergio_A on 03/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

class MyApplication: UIApplication{
    override func sendEvent(_ event: UIEvent) {
        print("Hola")
        super.sendEvent(event)
    }
}
