//
//  Message.swift
//  MAPD724_Assignment2_part1
//
//  Created by Sarthak Vashistha on 2023-03-26.
//

import Foundation
struct MessageModel: Identifiable, Codable {
    var id: String 
    var messageContent: String
    var messageRecivedStatus: Bool
    var dateRecivied: Date
}


