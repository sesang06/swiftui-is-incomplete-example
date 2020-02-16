//
//  MessageView.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI
import Combine

class MessageViewModel: ObservableObject {


  @Published var messageText = ""


  func changeMessage() {

  }

  func send() {

    print(self.messageText)
  }


}

struct MessageInputView: View {

  @State private var text: String = ""
  @State private var value: CGFloat = 0


  @ObservedObject var viewModel = MessageViewModel()

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
          .padding(8)


      }


    }
    .frame(width: nil, height: 50)
    .background(Color.white)
    .cornerRadius(20)
    .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)
    .offset(y: -self.value)
    .animation(.spring())
    .onAppear {

      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in


        let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

        let height = value.height


        self.value = height

      }


      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in


        let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

        let height = value.height


        self.value = height

      }

    }


    
  }
}




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


struct MessageTextView: View {

  var message: Message

  var body: some View {
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

  }

}

/*

 Text("이 곳에 글을 쓰고 있습니다…….")
 .font(Font.system(size: 16))
 .fontWeight(.semibold)
 .foregroundColor(Color.singleRgb(100))
 .padding(EdgeInsets(top: 0, leading: 52, bottom: 12, trailing: 24))

 */
struct MessageView: View {


  var messages: [Message] = Message.all()



  init() {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = UIColor.singleRgb(221)
  }

  var body: some View {

    return NavigationView {

      ZStack {
        List {
          ForEach(self.messages) { message in
            if message.isMain {
              MessageTitleView(message: message)
                .listRowInsets(EdgeInsets())
            } else {
              MessageTextView(message: message)
                .listRowInsets(EdgeInsets())
            }
          }
        }

        VStack {
          Spacer()
          MessageInputView()
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        }

      }
      .background(Color.singleRgb(221))
      .navigationBarTitle("메시지 화면", displayMode: .inline)

      .background(NavigationConfigurator { nc in

        nc.navigationBar.barTintColor = UIColor(red: 88.0/255.0, green: 110.0/255.0, blue: 241.0/255.0, alpha: 1)
        nc.navigationBar.tintColor = UIColor.white
        nc.navigationBar.titleTextAttributes = [
          .foregroundColor: UIColor.white]
      })
    }
  }

}

struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView()
  }
}
