//
//  MainView.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI



struct MainView: View {

  private var detailView: PageView<AnyView> {
    return PageView([
      AnyView(MemoDetailView()),
      AnyView(MessageView())

    ])
  }

  var body: some View {
    NavigationView {

      ZStack(alignment: .bottomTrailing) {
        ScrollView {
          MainRow()
          MainRow()
          MainRow()
        }

        NavigationLink(destination: self.detailView) {
          Image("create_white")
                        .foregroundColor(Color.white)
                        .frame(width: 56, height: 56)
                        .background(Color.style.mainBlue)
                        .cornerRadius(40)
                        .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)
                        .offset(x: -36, y: -36)
        }
      }

      .navigationBarTitle("메인 화면", displayMode: .inline)

      .background(NavigationConfigurator { nc in

        nc.navigationBar.barTintColor = UIColor(red: 88.0/255.0, green: 110.0/255.0, blue: 241.0/255.0, alpha: 1)
        nc.navigationBar.tintColor = UIColor.white
        nc.navigationBar.titleTextAttributes = [
          .foregroundColor: UIColor.white]
      })
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()

  }
}
