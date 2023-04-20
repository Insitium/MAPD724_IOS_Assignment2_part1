//
//  FetchedMessageModel.swift
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
