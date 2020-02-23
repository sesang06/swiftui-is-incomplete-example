//
//  MessageViewController.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import UIKit
import SnapKit
import Combine
import CombineDataSources
import SwiftUI
import RxSwift
import RxCocoa
import RxKeyboard


let singletonMainText = PublishSubject<String>()


final class MessageViewController: BaseViewController {

  private var subscriptions = [AnyCancellable]()


  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.register(MessageCell.self, forCellWithReuseIdentifier: "Cell")
    cv.backgroundColor = .white
    cv.delegate = self
    return cv
  }()

  let messageInputView = MessageInputUIKitView(frame: .zero)



  lazy var dataSource = self.makeDataSource()

  func makeDataSource() -> UICollectionViewDiffableDataSource<Section, Message> {
    let reuseIdentifier = "Cell"
    return UICollectionViewDiffableDataSource(
      collectionView: self.collectionView,
      cellProvider: { collectionView, indexPath, model -> UICollectionViewCell? in
        let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: reuseIdentifier,
          for: indexPath
          ) as! MessageCell
        cell.bind(message: model)
        return cell
    })
  }

  let vm = MessageVM()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor =  UIColor.singleRgb(221)

    self.view.addSubview(self.collectionView)
    self.view.addSubview(self.messageInputView)

    var snapShot = self.dataSource.snapshot()
    snapShot.appendSections([Section.plain])
    snapShot.appendItems(Message.all())
    self.dataSource.apply(snapShot)


    RxKeyboard.instance.visibleHeight
      .drive(onNext: { [weak self] keyboardVisibleHeight in
        guard let `self` = self, self.didMakeConstraints else { return }
        self.messageInputView.snp.updateConstraints { make in
          make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardVisibleHeight)
        }
        self.view.setNeedsLayout()
        UIView.animate(withDuration: 0) {
          self.view.layoutIfNeeded()
        }
      })
      .disposed(by: self.disposeBag)

    RxKeyboard.instance.willShowVisibleHeight
      .drive(onNext: { keyboardVisibleHeight in
        self.collectionView.contentOffset.y += keyboardVisibleHeight
      })
      .disposed(by: self.disposeBag)


    let input = MessageVMInput(text: self.messageInputView.text, sendText: self.messageInputView.sendText, viewDidLoad: PublishSubject<Void>(), mainText: singletonMainText)

    let output = self.vm.transfrom(input: input)

    output.append
      .drive(onNext: { [weak self] message in
        guard let self = self else { return }
        var snapShot = self.dataSource.snapshot()
        snapShot.appendItems(message)

        let indexPath = IndexPath(item: snapShot.indexOfItem(message.last!)!, section: 0)
        self.dataSource.apply(snapShot, animatingDifferences: true) {
          self.collectionView.scrollToItem(at:
            indexPath, at: .bottom, animated: true)
        }
      })
      .disposed(by: self.disposeBag)

    output.reload
      .drive(onNext: { [weak self] message in
        guard let self = self else { return }
        var snapShot = self.dataSource.snapshot()
        snapShot.reloadItems(message)
        self.dataSource.apply(snapShot)
      })
      .disposed(by: self.disposeBag)

  }


  override func makeConstraints() {
    super.makeConstraints()

    self.collectionView.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview()
      make.bottom.equalTo(self.messageInputView.snp.top)
    }

    self.messageInputView.snp.makeConstraints { make in
      make.right.left.equalToSuperview().inset(12)
      make.height.equalTo(50)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(12)
    }
  }

}



extension MessageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {


  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let message = self.dataSource.snapshot().itemIdentifiers[indexPath.item]
    let height = MessageCell.height(message: message, width: collectionView.frame.width)
    return CGSize(width: collectionView.frame.width, height: height)
  }
}


struct MessageVC: UIViewControllerRepresentable {

  typealias UIViewControllerType = MessageViewController

  func makeUIViewController(context: UIViewControllerRepresentableContext<MessageVC>) -> MessageViewController {
    return MessageViewController()
  }

  func updateUIViewController(_ uiViewController: MessageViewController, context: UIViewControllerRepresentableContext<MessageVC>) {

  }
}

