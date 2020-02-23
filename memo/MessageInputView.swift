//
//  MessageInputView.swift
//  memo
//
//  Created by 조세상 on 2020/02/18.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxBiBinding

final class MessageInputUIKitView: BaseView {


  let text = BehaviorRelay<String?>(value: "")
  let sendText = PublishSubject<Void>()

  private let textView: UITextView = {
    let view = UITextView()
    view.font = UIFont.systemFont(ofSize: 16)
    view.textContainer.lineFragmentPadding = 0
    view.textContainerInset = .zero
    return view
  }()


  let container: UIStackView = {
    let stackView = UIStackView()
    stackView.alignment = .center
    return stackView
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


  let sendButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "create"), for: .normal)
    button.backgroundColor = UIColor.style.mainBlue
    button.layer.cornerRadius = 18
    button.imageView?.contentMode = .scaleAspectFit
    button.tintColor = UIColor.white
    return button
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)


    self.addSubview(self.textShadowContainer)
    self.textShadowContainer.addSubview(self.textContainer)
    self.textContainer.addSubview(self.container)
    self.container.addArrangedSubview(self.textView)
    self.container.addArrangedSubview(self.sendButton)

    (self.textView.rx.text <-> self.text)
      .disposed(by: self.disposeBag)

    self.sendButton.rx.tap
      .bind(to: self.sendText)
      .disposed(by: self.disposeBag)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  override func makeConstraints() {
    super.makeConstraints()
    self.textShadowContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    self.textContainer.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    self.container.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5))
    }


    self.sendButton.snp.makeConstraints { make in
      make.size.equalTo(40)
    }
    self.textView.snp.makeConstraints { make in
      make.height.equalTo(20)
    }
  }



}

struct MessageInputView: View {

  @State private var text: String = ""
  @State private var value: CGFloat = 0


  @ObservedObject var viewModel: MessageViewModel

  init(viewModel: MessageViewModel) {
    self.viewModel = viewModel
  }

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
          .foregroundColor(Color.white)
          .padding(8)
      }
    }
    .frame(width: nil, height: 50)
    .background(Color.white)
    .cornerRadius(20)
    .shadow(color: Color.black.opacity(0.16), radius: 4, x: 1, y: 3)
    .offset(y: -self.viewModel.height)
    .animation(.spring())

  }
}
