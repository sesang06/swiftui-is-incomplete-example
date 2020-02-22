//
//  MessageCell.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import UIKit
import SnapKit

final class MessageCell: BaseCollectionViewCell {

  private let textView: UITextView = {
    let view = UITextView()
    view.font = UIFont.systemFont(ofSize: 16)
    view.textContainer.lineFragmentPadding = 0
    view.textContainerInset = .zero
    return view
  }()

  let textContainer: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 20
    view.backgroundColor = UIColor.white
    view.clipsToBounds = true
    return view
  }()

  let textShadowContainer: UIView = {
    let view = UIView()
    view.layer.shadowColor = UIColor.black.withAlphaComponent(0.16).cgColor
    view.layer.shadowRadius = 4
    view.layer.shadowOffset = CGSize(width: 1, height: 3)
    return view
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.singleRgb(221)
    self.addSubview(
      self.textShadowContainer
    )
    self.textShadowContainer.addSubview(
      self.textContainer
    )
    self.textContainer.addSubview(
      self.textView
    )
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(message: Message) {

    let style = NSMutableParagraphStyle()
    style.lineSpacing = 24
    self.textView.attributedText = NSAttributedString(string: message.text, attributes: [NSAttributedString.Key.paragraphStyle: style, .font: UIFont.systemFont(ofSize: 16)])
    self.textView.text = message.text
  }


  static func height(message: Message, width: CGFloat) -> CGFloat {
    let style = NSMutableParagraphStyle()
       style.lineSpacing = 24

    let text = NSAttributedString(string: message.text, attributes: [NSAttributedString.Key.paragraphStyle: style, .font: UIFont.systemFont(ofSize: 16)])
    let textWidth = width - 52 - 24 - 24 - 24
    return 12 + 12 + 24 + 24 + text.height(with: textWidth)

  }

  override func makeConstraints() {
    super.makeConstraints()

    self.textShadowContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(
        UIEdgeInsets(top: 12, left: 52, bottom: 12, right: 24)
      )
    }

    self.textContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    self.textView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(24)
    }
  }

}
