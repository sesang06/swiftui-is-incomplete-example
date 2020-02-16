//
//  SwiftUIView.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct MainRow: View {
  var body: some View {

    VStack(alignment: .leading) {

      Text("2020년 1월 5일")
        .font(Font.system(size: 16))
        .foregroundColor(Color.style.detailBlack)
        .frame(width: nil, height: 20)
        .padding(.bottom, 8)
        .padding(.top, 10)


      Text("메모의 제목")
        .font(Font.system(size: 20))
        .bold()
        .foregroundColor(Color.style.mainBlack)
        .frame(width: nil, height: 20)
        .padding(.bottom, 10)


      Text("상세한 내용 상세한 내용 상세한 내용 상세한 내용 상세한 내용 상세한 내용상세한 내용 상세한 내용 상세한 내용")
        .font(Font.system(size: 16))
        .foregroundColor(Color.style.mainBlack)
        .frame(width: nil, height: 44)
        .padding(.bottom, 8)


      Divider()


    }
    .padding(.leading, 16)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {

    NavigationView {

      ScrollView {

        MainRow()

        MainRow()
          MainRow()
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
