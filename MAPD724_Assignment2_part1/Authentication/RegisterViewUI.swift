//
//  RegisterViewUI.swift
//  MAPD724_Assignment2_part1
//
//  Created by Krisuv Bohara on 2023-03-26.
//

import SwiftUI
import FirebaseAuth
import Firebase
import LocationPicker
import CoreLocation
import MapKit
import FirebaseFirestore

struct RegisterViewUI: View {
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var location = ""
    @State private var registerStatusMessage = ""
    @State private var showHomePage = false
    @State private var coordinates = CLLocationCoordinate2D(latitude: 37.333747, longitude: -122.011448)
    @State private var showSheet = false
    @ObservedObject var lm = LocationManager()


    var body: some View {

        NavigationView{
            VStack{
                Text("Register").font(.largeTitle).bold().padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 350, height: 70)
                    .background(Color.black.opacity(0.02))
                    .cornerRadius(10)
                    
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 70)
                    .background(Color.black.opacity(0.02))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 350, height: 70)
                    .background(Color.black.opacity(0.02))
                    .cornerRadius(10).padding()
                
                HStack {
                    VStack{
                        TextField("Location", text: $location)
                            .padding()
                            .frame(width: 250, height: 70)
                            .background(Color.black.opacity(0.02))
                            .cornerRadius(10)                    }
                    VStack{
                        Button("Get") {
                            lm.address.reverseGeocodeLocation(CLLocation.init(latitude: lm.locationManager.location?.coordinate.latitude ?? 0.0, longitude:lm.locationManager.location?.coordinate.longitude ?? 0.0)) { (places, error) in
                                if error == nil{
                                    if let place = places{
                                        location = (place[0].name ?? "")
                                        
                                    }
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .frame(width: 65, height: 50)
                        .background(Color.green)
                        .cornerRadius(8)
                    }.padding()
                }
                .sheet(isPresented: $showSheet) {
                    NavigationView {
                        LocationPicker(
                            instructions: "Tap somewhere to select your coordinates", coordinates: $coordinates).navigationTitle("Location Picker")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(leading: Button(action: {
                                print(coordinates)
                                self.showSheet.toggle()
                            }, label: {
                                Text("Close").foregroundColor(.red)
                            }))
                    }
                }
                
//                NavigationLink() {
                    Button("Register") {
                        handleRegister()
                    }
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .navigationDestination(
                        isPresented: $showHomePage) {
                            LoginScreenUI()
                        }
//                }
                
                
                HStack {
                    VStack{
                        Divider().overlay(.pink)
                    }.padding()
                    Text("OR").foregroundColor(Color.blue)
                    VStack{
                        Divider().overlay(.pink)
                    }.padding()
                }
                
                    Button("Login") {}
                    .foregroundColor(.white)
                    .frame(width: 350, height: 50)
                    .background(Color.green)
                    .cornerRadius(16)
                    .navigationDestination(
                        isPresented: $showHomePage) {
                            UserListView()
                        }
                
                
                Text(self.registerStatusMessage).foregroundColor(.red)
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private func handleRegister(){
        let db = Firestore.firestore()

        if(username == "" && password == ""){
            registerStatusMessage = "Empty Fields"
        }else{
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.registerStatusMessage = error?.localizedDescription ?? ""
                } else {
                    self.registerStatusMessage = result?.user.uid ?? ""
                    let userData = ["email" : self.email, "username" : self.username ,"uid" : result?.user.uid, "address" : "111 Treverton Drive", "lat" : "43.738392", "lng" : "-79.266258"]
                                    print(userData)
                    db.collection("users").document((result?.user.uid)!).setData(userData as [String : Any]){
                        err in
                        if let err = err {
                            print (err)
                            self.registerStatusMessage = "\(err)"
                            return
                        }
                        else{
                            self.registerStatusMessage = "Added"
                            showHomePage = true
                        }
                    }
                }
            }
        }
    }
}

struct RegisterViewUI_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewUI()
    }
}
