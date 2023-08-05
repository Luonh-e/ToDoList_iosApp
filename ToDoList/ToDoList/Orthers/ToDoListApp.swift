//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
