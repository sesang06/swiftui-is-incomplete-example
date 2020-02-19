//
//  MessageView.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI
import Combine



struct MessageView: View {


  @ObservedObject var viewModel = MessageViewModel()



  init() {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = UIColor.singleRgb(221)
  }

  var body: some View {

      ZStack {
        List {
          ForEach(self.viewModel.messages) { message in
            if message.isMain {
              MessageTitleView(message: message)
                .listRowInsets(EdgeInsets())
            } else {
              MessageTextView(message: message)
                .listRowInsets(EdgeInsets())
            }
          }
          Spacer(minLength: self.viewModel.height + 12 + 50 + 12)
            .animation(.spring())
        }
        .edgesIgnoringSafeArea(.bottom)
//        .padding(.bottom, self.viewModel.height + 12 + 50 + 12)
//        .animation(.spring())

        VStack {
          Spacer()
          MessageInputView(viewModel: self.viewModel)
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        }

      }
    }

}





/*

 Text("이 곳에 글을 쓰고 있습니다…….")
 .font(Font.system(size: 16))
 .fontWeight(.semibold)
 .foregroundColor(Color.singleRgb(100))
 .padding(EdgeInsets(top: 0, leading: 52, bottom: 12, trailing: 24))

 */

struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView()
  }
}
