//
//  Color.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//


import SwiftUI
import UIKit


extension Color {



  static let style = Style()

  struct Style {

    var mainBlue: Color {
      return Color.rgb(84, 103, 247)
    }

    var mainBlack: Color {
      return Color.singleRgb(64)
    }

    var detailBlack: Color {
      return Color.singleRgb(112)
    }

  }


   static func rgb(_ r: Double, _ g: Double, _ b: Double) -> Color {

    return Color(red: r / 255, green: g / 255, blue: b / 255)
  }

   static func singleRgb(_ val: Double) -> Color {
     return self.rgb(val, val, val)
   }


}


extension UIColor {

  // MARK: System


  static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 255) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a / 255)
  }

  static func singleRgb(_ val: CGFloat) -> UIColor {
    return self.rgb(val, val, val)
  }

  static let style = Style()

  struct Style {

    var mainBlue: UIColor {
      return UIColor.rgb(84, 103, 247)
    }

    var mainBlack: UIColor {
      return UIColor.singleRgb(64)
    }

    var detailBlack: UIColor {
      return UIColor.singleRgb(112)
    }

  }


}
