//
//  MessageField.swift
//  MAPD724_Assignment2_part1
//
//  Created by Sarthak Vashistha on 2023-03-26.
//

import SwiftUI
import Firebase

struct MessageField: View {
    @ObservedObject var messageManager = MessageManager()
    @Binding var model: UserModel?

    @State private var message = ""
    @State private var text = ""

    var body: some View {
        HStack {
            TextField("Enter Message", text: $text)
            Button {
                message = text
                let fromId = Auth.auth().currentUser?.uid
                let toId = model?.id
             
                messageManager.sendMessage(id: fromId!, reciverId: toId!, content: message)
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.gray).opacity(0.5)
        .cornerRadius(50)
        .padding()
        
    }
}
    
    struct MessageField_Previews: PreviewProvider {
        @State static var mods: UserModel?
        static var previews: some View {
            MessageField(model: $mods)
        }
    }
