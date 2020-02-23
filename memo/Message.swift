//
//  File.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation


struct Message: Hashable, Codable, Identifiable {

  let id = UUID()

  let text: String

  let isMain: Bool

  init(text: String, isMain: Bool = false) {
    self.text = text
    self.isMain = isMain
  }
}

enum Section: CaseIterable {
  case main
  case plain
}


extension Message {

  static func make(string: String) -> [Message] {
    return string.split(separator: "\n")
      .map { String($0) }
      .map { Message(text: $0, isMain: false) }
  }

  static func transform(messages: [Message]) -> String {
    let substring = messages.map { $0.text }
      .map { Substring($0) }
      .reduce(Substring()) { $0 + "\n" + $1 }
    return String(substring)
  }

  static func all() -> [Message] {

    return [
    .init(text: "안드로이드는 전기 양의 꿈을 꾸는가?", isMain: true),
    .init(text: "보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 바이며, 우리 사막이다. 웅대한 이상 주며, 것이다. 인간이 그들의 힘차게 이것은 뜨고, 천하를 그들에게 부패뿐이다. 쓸쓸한 곳이 더운지라 주는 설레는 아름다우냐? 예가 우리 만천하의 찬미를 위하여서, 커다란 피가 것이다. 귀는 천지는 밝은 황금시대의 인간에 없는 소리다.이것은 무엇을 이것이다. 많이 거선의 인류의 불러 예가 충분히 아니한 것이다."),
    .init(text: "보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 바이며, 우리 사막이다. 웅대한 이상 주며, 것이다. 인간이 그들의 힘차게 이것은 뜨고, 천하를 그들에게 부패뿐이다. 쓸쓸한 곳이 더운지라 주는 설레는 아름다우냐? 예가 우리 만천하의 찬미를 위하여서, 커다란 피가 것이다. 귀는 천지는 밝은 황금시대의 인간에 없는 소리다.이것은 무엇을 이것이다. 많이 거선의 인류의 불러 예가 충분히 아니한 것이다.")
    ]

  }
}
