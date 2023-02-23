//
//  mini_project_swiftUIApp.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

@main
struct mini_project_swiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
