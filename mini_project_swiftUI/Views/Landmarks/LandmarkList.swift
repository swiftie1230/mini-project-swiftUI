//
//  LandmarkList.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

struct LandmarkList: View {
    // environmentObject를 사용하면 ObservableObject 객체를 전달할 필요 없이 모든 뷰에서 접근이 가능하다.
    @EnvironmentObject var modelData: ModelData
    
    // Toggle()의 현재 값을 저장하는 데 사용할 @State Boolean 속성을 정의
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            // List 후 클로저 안에 subviews들을 넣어서 구현
            // List 동적으로 생성
            // 배열의 각 요소를 id 프로퍼티를 기준으로 구분할 수 있도록 키 경로를 전달하였다 : Identifiable
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
        LandmarkList()
            .environmentObject(ModelData())
    }
}
