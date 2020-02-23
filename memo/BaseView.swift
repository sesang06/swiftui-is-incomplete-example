//
//  BaseView.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import UIKit
import RxSwift

class BaseView: UIView {


  let disposeBag = DisposeBag()

  // MARK: Initializer
  init() {
    super.init(frame: .zero)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  private func initialize() {
    self.backgroundColor = .clear
    self.translatesAutoresizingMaskIntoConstraints = false
  }


  // MARK: Layout
  private(set) var didMakeConstraints = false

  override func updateConstraints() {
    if !self.didMakeConstraints {
      self.makeConstraints()
      self.didMakeConstraints = true
    }
    super.updateConstraints()
  }

  func makeConstraints() {
    // Override point
  }

  func bind() {
    // Override point
  }

  // MARK: Object lifecycle
  deinit {
    print("deinit: \(String(describing: type(of: self)))")
  }

}
