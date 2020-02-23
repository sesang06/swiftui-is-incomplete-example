//
//  MeesageViewModel.swift
//  memo
//
//  Created by 조세상 on 2020/02/23.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MessageVMInput {
  let text: BehaviorRelay<String?>
  let sendText: Observable<Void>

  let viewDidLoad: Observable<Void>
}

struct MessageVMOutput {
  let append: Driver<[Message]>
}



final class MessageVM {





  func transfrom(input: MessageVMInput) -> MessageVMOutput {



    let append = input.sendText
      .withLatestFrom(input.text)
      .compactMap { $0 }
      .map { [Message(text: $0, isMain: false)] }
      .asDriver(onErrorJustReturn: [])

    return MessageVMOutput(append: append)

  }


}
