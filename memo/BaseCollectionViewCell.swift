//
//  BaseCollectionViewCell.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

  override open class var requiresConstraintBasedLayout: Bool {
    return true
  }

  // MARK: Reuse identifier


  // MARK: Initializer
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  private func initialize() {
    self.backgroundColor = .clear
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

  // MARK: Reuse lifecycle
  override func prepareForReuse() {
    super.prepareForReuse()
  }


  // MARK: Object lifecycle
  deinit {
    print("deinit: \(String(describing: type(of: self)))")
  }

}
