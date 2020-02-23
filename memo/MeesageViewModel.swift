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
  let mainText: Observable<String>
}

struct MessageVMOutput {
  let append: Driver<[Message]>
  let reload: Driver<[Message]>
}



final class MessageVM {
  
  
  
  
  
  func transfrom(input: MessageVMInput) -> MessageVMOutput {
    
    
    let reload = input.mainText.map { Message.make(string: $0) }
      .asDriver(onErrorJustReturn: [])
    
    let append = input.sendText
      .withLatestFrom(input.text)
      .compactMap { $0 }
      .map { Message.make(string: $0) }
      .do(onNext: { _ in
        input.text.accept(nil)
      })
      .asDriver(onErrorJustReturn: [])
    
    return MessageVMOutput(append: append, reload: reload)
    
  }
  
  
}
