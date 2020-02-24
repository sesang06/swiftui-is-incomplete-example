//
//  MessageData.swift
//  memo
//
//  Created by 조세상 on 2020/02/24.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation

class MessageData {

  var text: String

  var messages: [Message] {
    get {
      return Message.make(string: self.text)
    }
    set {
      self.text = Message.transform(messages: newValue)
    }
  }

  init(text: String) {
    self.text =  Message.transform(messages: Message.all())
  }


  static let shared = MessageData(text: "")
}
