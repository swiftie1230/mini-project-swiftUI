//
//  FavoriteButton.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/23.
//

import SwiftUI

struct FavoriteButton: View {
    // Because you use binding, changes made inside this view propagate back to the data source.
    // Binding 속성을 통하여 @State로 설정한 상태 프로퍼티를 바인딩하여 하위 뷰에 적용할 수 있으며, 여기서 발생한 변화 또한 data source로 전달된다.
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
