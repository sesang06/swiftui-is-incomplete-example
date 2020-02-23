//
//  PlainMeesageViewController.swift
//  memo
//
//  Created by 조세상 on 2020/02/23.
//  Copyright © 2020 조세상. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxKeyboard

final class PlainMeesageViewController: BaseViewController {

  private let titleTextView: UITextView = {
    let view = UITextView()
    view.font = UIFont.systemFont(ofSize: 24)
    view.textContainer.lineFragmentPadding = 0
    view.textContainerInset = .zero
    view.textColor = UIColor.style.mainBlack
    view.isScrollEnabled = false
    return view
  }()



  private let subTextView: UITextView = {
    let view = UITextView()
    view.font = UIFont.systemFont(ofSize: 16)
    view.textContainer.lineFragmentPadding = 0
    view.textContainerInset = .zero
    view.textColor = UIColor.style.mainBlack
    let style = NSMutableParagraphStyle()
       style.lineSpacing = 24
    view.typingAttributes = [
      NSAttributedString.Key.paragraphStyle: style, .font: UIFont.systemFont(ofSize: 16)]
    view.isScrollEnabled = false
    return view
  }()


  private let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.singleRgb(112).withAlphaComponent(50)
    return view
  }()

  private let scrollView: UIScrollView = {
    let view = UIScrollView()
    return view
  }()


  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view.addSubview(self.scrollView)
    self.scrollView.addSubview(self.titleTextView)
    self.scrollView.addSubview(self.lineView)
    self.scrollView.addSubview(self.subTextView)


    self.titleTextView.rx.attributedText
      .compactMap { $0 }
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] text in
        guard let `self` = self, self.didMakeConstraints else { return }
        let width = self.view.frame.width - 36
         let height = max(text.height(with: width), 20)
        self.titleTextView.snp.updateConstraints { make in
          make.height.equalTo(height)
        }
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0) {
          self.view.layoutIfNeeded()
        }

      })
      .disposed(by: self.disposeBag)


    self.subTextView.rx.attributedText
      .compactMap { $0 }
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] text in
        print(text)
        guard let `self` = self, self.didMakeConstraints else { return }
        let width = self.view.frame.width - 36
        let height = max(text.height(with: width), 20)
        self.subTextView.snp.updateConstraints { make in
          make.height.equalTo(height)
        }
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0) {
          self.view.layoutIfNeeded()
        }

      })
      .disposed(by: self.disposeBag)

    RxKeyboard.instance.visibleHeight
          .drive(onNext: { [weak self] keyboardVisibleHeight in
            guard let `self` = self, self.didMakeConstraints else { return }
            self.scrollView.snp.updateConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardVisibleHeight)
            }
            self.view.setNeedsLayout()
            UIView.animate(withDuration: 0) {
              self.view.layoutIfNeeded()
            }
          })
          .disposed(by: self.disposeBag)

  }

  override func makeConstraints() {
    super.makeConstraints()

    self.scrollView.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      make.left.right.equalToSuperview()
      make.width.equalToSuperview()
    make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
    }

    self.titleTextView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.height.equalTo(30)
      make.left.equalToSuperview().offset(18)
      make.right.equalToSuperview().offset(-18)
    }
    self.lineView.snp.makeConstraints { make in
      make.top.equalTo(self.titleTextView.snp.bottom).offset(16)
      make.height.equalTo(1)
      make.left.equalToSuperview().offset(18)
      make.right.equalToSuperview()
      make.width.equalToSuperview().offset(-18)
    }
    self.subTextView.snp.makeConstraints { make in
      make.top.equalTo(self.lineView.snp.bottom).offset(20)
      make.left.equalToSuperview().offset(18)
      make.right.equalToSuperview().offset(-18)
      make.bottom.equalToSuperview()
      make.height.equalTo(15)
    }
  }

}
