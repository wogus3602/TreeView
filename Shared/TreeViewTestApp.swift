//
//  TreeViewTestApp.swift
//  Shared
//
//  Created by USER on 2021/09/07.
//

import SwiftUI

@main
struct TreeViewTestApp: App {
    let item: Item = dummyItems2
    
    var body: some Scene {
        WindowGroup {
            ContentView(item: item)
        }
    }
}
