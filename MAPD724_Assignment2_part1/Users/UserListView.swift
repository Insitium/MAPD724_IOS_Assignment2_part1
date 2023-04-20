//
//  UserListView.swift
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


struct UserListView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    @State private var showMessagePage = false
    @State private var user : UserModel?

    
    init() {
        if(FirebaseApp.app() == nil){
            FirebaseApp.configure()
        }
    }
    
    var body: some View {
        NavigationStack{
              List(viewModel.users) { v in
                  Button(action: {
                      self.user = v
                      showMessagePage = true

                  }) {
                      VStack(alignment: .leading) {
                          Text(v.username).foregroundColor(Color(.label))
                          Text(v.email)
                              .font(.subheadline).foregroundColor(Color(.label))
                          Text("\(v.address)")
                              .font(.subheadline).foregroundColor(Color(.label))
                      }
                  }
              }.navigationDestination(
                isPresented: $showMessagePage) {
                    ContentView(
                        model: $user
                    )
                }
                .navigationBarBackButtonHidden(true)
              .navigationBarTitle("All App Users")
              .onAppear() {
                self.viewModel.fetchData()
              }
            }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
