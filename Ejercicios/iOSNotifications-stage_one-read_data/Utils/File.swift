//
//  File.swift
//  BunsanMessenger
//
//  Created by Misael Pérez Chamorro on 6/1/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation
import UIKit

struct File {
  
  static func readMessages() -> [[String: String]]? {
    if let path = Bundle.main.path(forResource: "messages" , ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let jsonObj = try JSONSerialization.jsonObject(with: data, options: [])
        return jsonObj as? [[String: String]]
      } catch let error {
        debugPrint(error.localizedDescription)
        return nil
      }
    } else {
      debugPrint("Invalid filename/path.")
      return nil
    }
  }
}
