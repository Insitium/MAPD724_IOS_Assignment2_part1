//
//  ContentView.swift
//  MAPD724_Assignment2_part1
//
//  Created by Sarthak Vashistha on 2023-03-26.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var model: UserModel?
    @State private var showTime = false
    @ObservedObject var viewModel = MessageManager()
    @State var gotoPage4 = false

    
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().navigationBarBackButtonHidden(true).toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button(action: {
                            gotoPage4 = true
                        }){
                            HStack {
                                Image(systemName: "house") // set image here
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.blue)
                                Text("Go back")
                            }.navigationDestination(
                                isPresented: $gotoPage4) {
                                    UserListView()
                                }
                        }
                    })
                })
                
                ScrollView {
                    
                    ForEach(viewModel.chatMessages, id: \.self) { text in
                        
                        VStack {
                            if text.fromId == Auth.auth().currentUser?.uid {
                                                      HStack {
                                                          Spacer()
                                                          HStack {
                                                              Text(text.content)
                                                                  .foregroundColor(.white)
                                                          }
                                                          .padding()
                                                          .background(Color.green)
                                                          .cornerRadius(8)
                                                      }
                                                  } else {
                                                      HStack {
                                                          HStack {
                                                              Text(text.content)
                                                                  .foregroundColor(.white)
                                                          }
                                                          .padding()
                                                          .background(Color.blue)
                                                          .cornerRadius(8)
                                                          Spacer()
                                                      }
                                                  }
                                              }
                                              .padding(.horizontal)
                                              .padding(.top, 8)
                                              
                                          }
                    }
                }
                MessageField(
                    model: $model)
                
            }.navigationTitle(model?.username ?? "").navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true).onAppear() {
                self.viewModel.getMessages(userid: model?.id ?? "")
            }
            
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        
        @State static var mods: UserModel?
        static var previews: some View {
            ContentView(model:$mods)
        }
    }

