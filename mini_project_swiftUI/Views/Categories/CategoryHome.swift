//
//  CategoryHome.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/23.
//

import SwiftUI

struct CategoryHome: View {
    // You’ll need access to the categories right now, as well as to other landmark data later.
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        // You use navigation views along with NavigationLink instances and related modifiers to build hierarchical navigation structures in your app.
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    key in CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                // Set the edge insets to zero so the content can extend to the edges of the display.
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
