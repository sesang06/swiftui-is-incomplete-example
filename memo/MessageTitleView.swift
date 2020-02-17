//
//  MessageTitleView.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation
import SwiftUI



struct MessageTitleView: View {

  var message: Message

  var body: some View {

    Group() {

      HStack() {
        Text(self.message.text)
          .font(Font.system(size: 18))
          .bold()
          .lineSpacing(24)
          .foregroundColor(Color.white)

        Spacer()
      }
      .padding(24)
      .background(Color.style.mainBlue)
      .cornerRadius(20)
      .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)

    }
    .padding(EdgeInsets(top: 12, leading: 52, bottom: 12, trailing: 24))
    .background(Color.singleRgb(221))

  }
}
