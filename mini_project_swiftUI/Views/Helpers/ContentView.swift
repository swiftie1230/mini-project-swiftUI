//
//  ContentView.swift
//  mini_project_swiftUI
//
//  Created by 황서진 on 2023/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
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
