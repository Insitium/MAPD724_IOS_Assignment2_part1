//
//  MessageManager.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-04-18.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var chatMessages = [FetchedMessagesModel]()

    
    func sendMessage(id : String, reciverId : String,content: String ){
        let doc = db.collection("messages").document(id).collection(reciverId).document()
        let recipent = db.collection("messages").document(reciverId).collection(id).document()
        
        let message = ["fromId" : id, "toId" : reciverId, "content" : content, "date" : Timestamp()] as [String : Any]
        
        
        doc.setData(message){
            error in
            if error != nil{
                print("error")
            }
        }
        recipent.setData(message){
            error in
            if error != nil{
                print("error")
            }
        }
    }
    
    func getMessages(userid : String) {
        let fromId = Auth.auth().currentUser?.uid
        let toId = userid
        db
             .collection("messages")
             .document(fromId!)
             .collection(toId)
             .addSnapshotListener { querySnapshot, error in
                 guard (querySnapshot?.documents) != nil else {
                   return
               }
                 
               
                 querySnapshot?.documentChanges.forEach({ change in
//                                    if change.type == .added {
                                        let data = change.document.data()
                                        self.chatMessages.append(.init(documentId: change.document.documentID, data: data))
//                                    }
                                })
                            }
       }
    

   }

