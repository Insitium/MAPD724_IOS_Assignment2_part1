//
//  MAPD724_Assignment2_part1App.swift
//  MAPD724_Assignment2_part1
//
//  Created by Sarthak Vashistha on 2023-03-26.
//

import SwiftUI
import Firebase

@main
struct MAPD724_Assignment2_part1App: App {
    
    init() {
      FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginScreenUI()
        }
    }
}
