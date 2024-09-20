//
//  ToDoListIOSApp.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListIOSApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
