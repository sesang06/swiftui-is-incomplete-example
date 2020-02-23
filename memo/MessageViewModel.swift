//
//  MessageViewModel.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import Combine
import SwiftUI



class MessageViewModel: ObservableObject {


  @Published var messageText = ""

  @Published var messages = Message.all()


  @Published var height: CGFloat = 0

  func changeMessage() {

  }

  func send() {

    print(self.messageText)
    let message = Message(text: self.messageText, isMain: false)

    self.messageText = ""

    self.messages.append(message)
  }


  init() {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in

      let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
      let height = value.height
      self.height = height
    }


    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in

      let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

      let height = value.height


      self.height = 0

    }
  }

}
