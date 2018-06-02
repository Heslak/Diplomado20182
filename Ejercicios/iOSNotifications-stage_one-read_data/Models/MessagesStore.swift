//
//  MessagesStore.swift
//  BunsanMessenger
//
//  Created by Misael Pérez Chamorro on 6/1/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

class MessagesStore: NSObject {
  static let sharedInstance = MessagesStore()
  var messages: [Message] = []
  
  private override init() {
    super.init()
  }
  
  func fetchMessagesFromJson() {
    guard let jsonItems = File.readMessages() else {return}
    
    for message in jsonItems {
      let name = message["name"]
      let content = message["content"]
      let url = message["url"]
      let _ = createMessage(content: content!, name: name!, avatar: URL(string: url!)!)
    }
  }
  
  func createMessage(content: String, name: String, avatar: URL) -> Message {
    let message = Message(withContent: content,
                          userName: name,
                          avatar: avatar)
    messages.append(message)
    return message
  }
}
