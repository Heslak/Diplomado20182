//
//  message.swift
//  BunsanMessenger
//
//  Created by Misael Pérez Chamorro on 6/1/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

struct Message {
  var content: String
  var date: Date
  var userName: String
  var avatar: URL
  
  init(withContent content: String, userName: String, avatar: URL) {
    self.content = content
    self.userName = userName
    self.avatar = avatar
    self.date = Date()
  }
}
