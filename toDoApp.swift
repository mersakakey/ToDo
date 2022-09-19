//
//  toDoApp.swift
//  Shared
//
//  Created by Takeru Sakakibara on 2022/05/16.
//

import SwiftUI

@main
struct toDoApp: App {
    @StateObject private var todoModel = ToDoModel()
    var body: some Scene {
        WindowGroup{
            home(selectedTab: TaskStatus.WantToDo)
                .environmentObject(todoModel)
        }
    }
}
