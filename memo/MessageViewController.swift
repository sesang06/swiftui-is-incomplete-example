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

final class MessageViewController: BaseViewController {


  let data = CurrentValueSubject<[Message], Never>(Message.all())
  private var subscriptions = [AnyCancellable]()


  private lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    cv.register(MessageCell.self, forCellWithReuseIdentifier: "Cell")
    cv.backgroundColor = .white
    cv.delegate = self
    return cv
  }()



  override func viewDidLoad() {
    super.viewDidLoad()
//    self.view.backgroundColor = UIColor.systemBackground
    self.view.backgroundColor = .green
    self.view.addSubview(self.collectionView)

    self.data
    .bind(subscriber: collectionView.itemsSubscriber(cellIdentifier: "Cell", cellType: MessageCell.self, cellConfig: { cell, indexPath, model in
      print(model.text)
      cell.bind(message: model)
    }))
    .store(in: &subscriptions)

    self.data.send(Message.all())
//
    self.data.send(Message.all())
//
//    self.data.send(Message.all())
  }


  override func makeConstraints() {
    super.makeConstraints()

    self.collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}



extension MessageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {


  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let message = data.value[indexPath.item]
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

