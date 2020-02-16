//
//  MemoDetailView.swift
//  memo
//
//  Created by 조세상 on 2020/02/16.
//  Copyright © 2020 조세상. All rights reserved.
//

import SwiftUI

struct MemoDetailView: View {
  var body: some View {

    ScrollView {
      Text("보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 ")
        .font(Font.system(size: 24))
        .fontWeight(.medium)
        .multilineTextAlignment(.leading)
        .lineSpacing(24)
        .foregroundColor(Color.style.mainBlack)

      Divider()

      Text("보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 보이는 실현에 우리의 하는 때문이다. 인도하겠다는 끓는 이상을 무엇을 있다. 두기 ")
        .font(Font.system(size: 16))
        .multilineTextAlignment(.leading)
        .lineSpacing(24)
        .foregroundColor(Color.style.mainBlack)

    }
    .padding(EdgeInsets(top: 20, leading: 18, bottom: 20, trailing: 18))
  }
}

struct MemoDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MemoDetailView()
  }
}
