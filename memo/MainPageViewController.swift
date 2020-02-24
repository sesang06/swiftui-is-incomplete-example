//
//  MainPageViewController.swift
//  memo
//
//  Created by 조세상 on 2020/02/23.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation

import UIKit

class MainPageViewController: BaseViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  var pageController: UIPageViewController!
  var controllers = [UIViewController]()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white

    pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    pageController.dataSource = self
    pageController.delegate = self

    addChild(pageController)
    view.addSubview(pageController.view)

    let views = ["pageController": pageController.view] as [String: AnyObject]
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))

    controllers.append(MessageViewController())

    controllers.append(PlainMessageViewController())

    pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    if let index = controllers.firstIndex(of: viewController) {
      if index > 0 {
        return controllers[index - 1]
      } else {
        return nil
      }
    }

    return nil
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    if let index = controllers.firstIndex(of: viewController) {
      if index < controllers.count - 1 {
        return controllers[index + 1]
      } else {
        return nil
      }
    }

    return nil
  }

}
