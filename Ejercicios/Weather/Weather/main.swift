//
//  Main.swift
//  Weather
//
//  Created by d182_Sergio_A on 03/03/18.
//  Copyright © 2018 seedvi. All rights reserved.
//

import UIKit

UIApplicationMain(CommandLine.argc,
                  UnsafeMutableRawPointer(CommandLine.unsafeArgv)
                    .bindMemory(
                        to: UnsafeMutablePointer<Int8>.self,
                        capacity: Int(CommandLine.argc)),
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass (AppDelegate.self)
)
