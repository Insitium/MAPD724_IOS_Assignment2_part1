//
//  user.viewmodel
//  Frameworks App - GeoChat App - Created Simple UI
//
//  MAPD724_Assignment2_part1App.swift

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
import Firebase
import FirebaseFirestore

class UserViewModel: ObservableObject {
    
    init() {
        fetchData()
    }
    
    
  @Published var users = [UserModel]()
    private var db = Firestore.firestore()

     func fetchData() {
         db.collection("users").whereField("uid", isNotEqualTo: Auth.auth().currentUser!.uid).addSnapshotListener { (querySnapshot, error) in
         guard let documents = querySnapshot?.documents else {
           print("No documents")
           return
         }

         self.users = documents.map { queryDocumentSnapshot -> UserModel in
           let data = queryDocumentSnapshot.data()
             let id = data["uid"] as? String ?? ""
             let email = data["email"] as? String ?? ""
             let address = data["address"] as? String ?? ""
             let username = data["username"] as? String ?? ""
             let lat = data["lat"] as? Double ?? 0.0
             let lng = data["lng"] as? Double ?? 0.0
             let userx =  UserModel(id: id, email: email, address: address, username: username,lat: lat, lng: lng)
             return userx
         }
       }
     }
   }

