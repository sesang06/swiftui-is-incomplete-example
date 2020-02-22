//
//  String.swift
//  memo
//
//  Created by 조세상 on 2020/02/22.
//  Copyright © 2020 조세상. All rights reserved.
//

import Foundation
import UIKit


extension String {
  var trimmed: String {
    return self.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  func height(with width: CGFloat, font: UIFont, limitedBy lineOfNumber: Int = .max) -> CGFloat {
    let height = CGFloat(font.lineHeight) * CGFloat(lineOfNumber)
    let constraintRect = CGSize(width: width, height: height)
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      attributes: [.font: font],
      context: nil
    )

    return ceil(boundingBox.height)
  }

  func width(with height: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      attributes: [.font: font],
      context: nil
    )

    return ceil(boundingBox.width)
  }

  var isNumber: Bool {
    return CharacterSet(charactersIn: "0123456789")
      .isSuperset(of: CharacterSet(charactersIn: self)) && !self.isEmpty
  }
}

extension NSAttributedString {
  func height(with width: CGFloat) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      context: nil)

    return ceil(boundingBox.height)
  }

  func width(with height: CGFloat) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(
      with: constraintRect,
      options: .usesLineFragmentOrigin,
      context: nil
    )

    return ceil(boundingBox.width)
  }
}

extension StringProtocol where Index == String.Index {
  func nsRange(string: String) -> NSRange? {
    if let range = self.range(of: string) {
      return NSRange(range, in: self)
    }
    return nil
  }
}
