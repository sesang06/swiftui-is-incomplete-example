//
//  PlainMessageViewModel.swift
//  memo
//
//  Created by 조세상 on 2020/02/24.
//  Copyright © 2020 조세상. All rights reserved.
//


import RxSwift
import RxCocoa




final class PlainMessageViewModel {


  struct Input {
    let viewWillAppear: ControlEvent<Bool>
    let viewWillDisappear: ControlEvent<Bool>
  }


  let titleText: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)
  let detailText: BehaviorRelay<String?> = BehaviorRelay<String?>(value: nil)

  let outputMessage: Observable<[Message]>

  let disposeBag = DisposeBag()

  init() {
    self.outputMessage = self.titleText
      .compactMap { $0 }
      .map { Message.make(string: $0) }
  }


  func transform(input: Input) {
    let reload = input.viewWillAppear
      .flatMap { _ -> Observable<String> in
        return Observable.just(MessageData.shared.text)
    }
    .asDriver(onErrorJustReturn: "")

    reload.drive(onNext: { text in
      self.detailText.accept(text)
    })
      .disposed(by: self.disposeBag)
    //
    //    input.viewWillDisappear
    //      .withLatestFrom(self.detailText)
    //      .compactMap { $0 }
    //      .subscribeOn(MainScheduler.instance)
    //      .subscribe(onNext: { text in
    //        MessageData.shared.text = text
    //      })
    //      .disposed(by: self.disposeBag)

    self.detailText
      .compactMap { $0 }
      .subscribeOn(MainScheduler.instance)
      .subscribe(onNext: { text in
        MessageData.shared.text = text
      })
      .disposed(by: self.disposeBag)
    

  }



}
