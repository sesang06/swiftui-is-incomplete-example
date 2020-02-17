//
//  MessageInputView.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI

struct MessageInputView: View {

  @State private var text: String = ""
  @State private var value: CGFloat = 0


  @ObservedObject var viewModel: MessageViewModel

  init(viewModel: MessageViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {

    HStack(alignment: .center) {
      Spacer()
        .frame(width: 20)


      TextField("HELLo", text: $viewModel.messageText)
        .font(Font.system(size: 16))
        .lineSpacing(24)
        .foregroundColor(Color.style.mainBlack)

      Spacer()

      Button(action: {
        self.viewModel.send()
      }) {
        Image("create")
          .frame(width: 40, height: 40)
          .background(Color.style.mainBlue)
          .cornerRadius(18)
          .foregroundColor(Color.white)
          .padding(8)
      }
    }
    .frame(width: nil, height: 50)
    .background(Color.white)
    .cornerRadius(20)
    .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)
    .offset(y: -self.viewModel.height)
    .animation(.spring())

  }
}
