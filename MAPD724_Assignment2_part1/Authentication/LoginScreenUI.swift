//
//  LoginScreenUI.swift
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

struct LoginScreenUI: View {
    
    @State private var username = ""
    @State private var password = ""
    @State var authStatusMessage = ""
    @State private var showHomePage = false

    init() {
        if(FirebaseApp.app() == nil){
            FirebaseApp.configure()
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Login").font(.largeTitle).bold().padding()
                
                TextField("Email", text: $username)
                    .padding()
                    .frame(width: 350, height: 70)
                    .background(Color.black.opacity(0.02))
                    .cornerRadius(10)
                    
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 70)
                    .background(Color.black.opacity(0.02))
                    .cornerRadius(10).padding()
                
                    Button("Login") {
                        handleLogin()
                    }
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color.green)
                    .cornerRadius(16)
                    .navigationDestination(
                        isPresented: $showHomePage) {
                            UserListView()
                        }
                
                HStack {
                    VStack{
                        Divider().overlay(.pink)
                    }.padding()
                    Text("OR").foregroundColor(Color.blue)
                    VStack{
                        Divider().overlay(.pink)
                    }.padding()
                }
                
                NavigationLink(destination: RegisterViewUI()) {
                    Button("Register") {
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color.blue)
                    .cornerRadius(16)
                }
                
                Text(self.authStatusMessage).foregroundColor(.red)
            }
            

        }.navigationBarBackButtonHidden(true)
        
    }
    
    private func handleLogin(){
        if(username == "" && password == ""){
            showHomePage = false
            authStatusMessage = "xx"
        }else{
            Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
                if error != nil {
                    self.authStatusMessage = error?.localizedDescription ?? ""
                    showHomePage = false
                } else {
                    showHomePage = true
                    self.authStatusMessage = result?.user.uid ?? ""
                }
            }
        }
    }
}



struct LoginScreenUI_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenUI()
    }
}
