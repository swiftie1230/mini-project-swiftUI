//
//  FavoriteButton.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/23.
//

import SwiftUI

struct FavoriteButton: View {
    // Because you use binding, changes made inside this view propagate back to the data source.
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
