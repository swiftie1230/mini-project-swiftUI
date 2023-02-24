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
    @State private var showingProfile = false
    
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
            .listStyle(.inset)
                .navigationTitle("Featured")
                // TabBar와의 차이점
                // TabBar: 현재 컨텍스트와 연관되지 않은 화면이동
                // ToolBar: 현재 컨텍스트와 관련된 항목 추가, 삭제, 주석 추가, 사진 촬영과 같은 일
                .toolbar {
                    Button {
                        // .toggle()
                        // :Use this method to toggle a Boolean value from true to false or from false to true.
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
