//
//  user.model.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-04-18.
//

import Foundation

struct UserModel: Identifiable, Codable {
    var id: String
    var email: String
    var address: String
    var username: String
    var lat: Double
    var lng: Double
}
