//
//  FetchedMessageModel.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-04-18.
//

import Foundation

struct FetchedMessagesModel: Hashable,Identifiable, Codable {
    var id: String { documentId }
    let documentId: String
    var content: String
    var date: String
    var fromId : String
    var toId : String
    
    init(documentId: String, data: [String: Any]) {
        self.documentId = documentId
        self.fromId = data["fromId"] as? String ?? ""
        self.toId = data["toId"] as? String ?? ""
        self.content = data["content"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
    }
}
