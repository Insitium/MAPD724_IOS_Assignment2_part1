//
//  UserListView.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-04-18.
//

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
