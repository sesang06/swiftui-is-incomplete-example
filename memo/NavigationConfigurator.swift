//
//  NavigationConfigurator.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
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
