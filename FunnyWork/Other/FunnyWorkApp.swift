//
//  FunnyWorkApp.swift
//  FunnyWork
//
//  Created by IOS on 25/05/2023.
//

import SwiftUI
import FirebaseCore

@main
struct FunnyWorkApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
         MainView()
        }
    }
}
