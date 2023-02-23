//
//  mini_project_swiftUIApp.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

@main
struct mini_project_swiftUIApp: App {
    // Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
