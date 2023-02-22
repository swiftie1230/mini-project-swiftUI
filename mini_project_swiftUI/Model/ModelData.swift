//
//  ModelData.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import Foundation

// create an array of landmarks that you initialize from landmark.json.
var landmarks: [Landmark] = load("landmarkData.json")

// A load(_:) method that fetches JSON data with a given name from the app's main bundle.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // If we want to read the URL for a file inour main app bundle, we use Bundle.main.url()
    // If extension is an empty string or nil, the returned pathname is the first one encountered where the file name exactly matches name.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        // try는 do catch 블럭이 아니더라도 구현 가능하지만 실패한다면 nil을 리턴하기 때문에 주의
        // → 어떤 에러가 리턴되었는지도 확인할 수 없기 때문에 일반적으로 do catch를 통해 구현하기
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // The content of the file(data) is "JSON" type rather than the actual data type that we want !
    // So we have to decode the data.
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
