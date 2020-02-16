//
//  Color.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//


import SwiftUI


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

