//
//  Landmark.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import Foundation
import SwiftUI
import CoreLocation

// Codable
// : When you only want to convert JSON data into a struct, you can conform your object to Decodable.
// : If you only want to transform instances of your struct into Data , you can conform your object to Encodable.
// : And if you want to do both you can conform your object to Codable.

// Hashable
// : A type that can be hashed into a Hasher to produce an integer hash value.
// Dictionary에서 key 값은 무조건 어떤 프로퍼티를 해시 할지에 대해 정의해야 하는, 바로 Hashable이란 프로토콜을 준수하고 있는 타입만이 가능
// 1. 구조체에서 Hashable을 채택하는 방법
// 매우 간단하다. Equatable과 마찬가지로 만약 구조체 내 프로퍼티가 모두 기본 자료형이라면, Hashable을 채택하는 것만으로 추가 구현 없이 사용 가능

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    // private
    // : 선언된 괄호 -{} 안에서만 접근이 가능합니다.
    // : 객체 인스턴스화 된 Landmark.imageName은 접근할 수 없음 !
    // : Landmark 내 접근 가능한 내부 함수를 통하여 사용할 수는 있음 !
    // : 만약 .swift 파일의 최상단 import 부분 밑에 private 변수를 선언할 경우에는 해당 swift파일의 어디에서든 사용 가능하게 됩니다.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    // Compute a location Coordinate property that's useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
