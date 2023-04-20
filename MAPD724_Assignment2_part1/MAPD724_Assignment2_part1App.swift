//
//  MAPD724_Assignment2_part1App.swift


//  Frameworks App - GeoChat App - Created Simple UI
//
//  Created on 2023-03-26.
/*
    Amrik Singh(301296257)
    Hafiz Shaikh(301282061)
    Krisuv Bohara(301274636)
    Manmeen Kaur(301259638)
    Sarthak Vashistha(301245284)
*/
//  Version 1.0.0


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
