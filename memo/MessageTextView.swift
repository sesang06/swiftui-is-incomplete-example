//
//  MessageTextView.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI



struct MessageTextView: View {

  var message: Message

  var body: some View {

    ZStack(alignment: .bottomLeading) {

      Group() {

        HStack() {
          Text(self.message.text)
            .font(Font.system(size: 16))
            .lineSpacing(24)
            .foregroundColor(Color.style.mainBlack)


          Spacer()
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)


      }
      .padding(EdgeInsets(top: 12, leading: 52, bottom: 12, trailing: 24))
      .background(Color.singleRgb(221))

      Image("insert_text")
             .fixedSize()
             .offset(x: 0, y: 10)
      .zIndex(10)

    }

  }

}
