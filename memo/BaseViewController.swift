//
//  BaseViewController.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController {


  // MARK: Initializer
  let disposeBag = DisposeBag()

  init() {
    super.init(nibName: nil, bundle: nil)
    self.hidesBottomBarWhenPushed = true
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    self.init(nibName: nil, bundle: nil)
  }


  // MARK: Layout
  private(set) var didMakeConstraints = false

  override func updateViewConstraints() {
    if !self.didMakeConstraints {
      self.makeConstraints()
      self.didMakeConstraints = true
    }
    super.updateViewConstraints()
  }

  func makeConstraints() {
    // Override point
  }


  // MARK: Object lifecycle

  deinit {
    print("deinit: \(String(describing: type(of: self)))")
  }
}
