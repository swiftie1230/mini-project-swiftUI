//
//  ContentView.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // add the model object to the environment, which makes the object available to any subview.
        // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
        ContentView()
            .environmentObject(ModelData())
    }
}
