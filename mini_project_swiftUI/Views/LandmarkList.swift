//
//  LandmarkList.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            // List 후 클로저 안에 subviews들을 넣어서 구현
            // List 동적으로 생성
            // 배열의 각 요소를 id 프로퍼티를 기준으로 구분할 수 있도록 키 경로를 전달하였다 : Identifiable
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8", "iPhone Xs Max"], id: \.self) {
            deviceName in LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}
