//
//  SwiftUIView.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI


struct MainRow: View {
  var body: some View {

    VStack(alignment: .leading) {

      Text("2020년 1월 5일")
        .font(Font.system(size: 16))
        .foregroundColor(Color.style.detailBlack)
        .frame(width: nil, height: 20)
        .padding(.bottom, 8)
        .padding(.top, 10)


      Text("메모의 제목")
        .font(Font.system(size: 20))
        .bold()
        .foregroundColor(Color.style.mainBlack)
        .frame(width: nil, height: 20)
        .padding(.bottom, 10)


      Text("상세한 내용 상세한 내용 상세한 내용 상세한 내용 상세한 내용 상세한 내용상세한 내용 상세한 내용 상세한 내용")
        .font(Font.system(size: 16))
        .foregroundColor(Color.style.mainBlack)
        .frame(width: nil, height: 44)
        .padding(.bottom, 8)


      Divider()


    }
    .padding(.leading, 16)
  }
}

