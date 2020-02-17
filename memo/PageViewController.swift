//
//  PageViewController.swift
//  memo
//
//  Created by 조세상 on 2020/02/17.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {


  var controllers: [UIViewController]

  @Binding var currentPage: Int

  func makeCoordinator() -> PageViewController.Coordinator {
    Coordinator(self)
  }


  func makeUIViewController(context: Context) -> UIPageViewController {
    let pageViewController = UIPageViewController(
      transitionStyle: .scroll,
      navigationOrientation: .horizontal)
    pageViewController.delegate = context.coordinator
    pageViewController.dataSource = context.coordinator
    return pageViewController
  }

  func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
    pageViewController.setViewControllers(
      [controllers[currentPage]], direction: .forward, animated: true)
  }

  class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var parent: PageViewController

    init(_ pageViewController: PageViewController) {
      self.parent = pageViewController
    }

    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index == 0 {
        return parent.controllers.last
      }
      return parent.controllers[index - 1]
    }

    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      if index + 1 == parent.controllers.count {
        return parent.controllers.first
      }
      return parent.controllers[index + 1]
    }
  }
}


struct PageView_Preview: PreviewProvider {


  static var previews: some View {

    PageView.init([
      AnyView(MessageView()),
      AnyView(MemoDetailView())
    ])

  }
}




struct PageView<Page: View>: View {
  var viewControllers: [UIHostingController<Page>]
  @State var currentPage = 0

  init(_ views: [Page]) {
    self.viewControllers = views.map { UIHostingController(rootView: $0) }
  }
  var body: some View {
      PageViewController(controllers: viewControllers, currentPage: $currentPage)
  }
}
