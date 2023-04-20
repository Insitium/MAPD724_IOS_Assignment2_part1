////
////  MessageBubble.swift
////  MAPD724_Assignment2_part1
////
////  Created by Sarthak Vashistha on 2023-03-26.
////
//
//import SwiftUI
//import Firebase
//
//struct MessageBubble: View {
//    var message: FetchedMessagesModel
//    @State private var showTime = false
//    
//    var body: some View {
//        VStack(alignment: message.fromId == Auth.auth().currentUser?.uid ? .leading : .trailing) {
//            HStack {
//                Text(message.content)
//                    .padding()
//                    .foregroundColor(Color.white)
//                    .background(message.fromId == Auth.auth().currentUser?.uid  ? Color.blue : Color.green)
//                    .cornerRadius(12)
//            }
//            .frame(maxWidth: 300, alignment: message.fromId == Auth.auth().currentUser?.uid  ? .leading : .trailing)
//            .onTapGesture {
//                showTime.toggle()
//            }
//            
//            if showTime {
//                Text("\(message.date.formatted(.dateTime.hour().minute()))")
//                    .font(.caption2)
//                    .background(Color.white)
//                    .padding(message.fromId == Auth.auth().currentUser?.uid  ? .leading : .trailing, 25)
//            }
//        }
//        .frame(maxWidth: .infinity, alignment: message.fromId == Auth.auth().currentUser?.uid  ? .leading : .trailing)
//        .padding(message.fromId == Auth.auth().currentUser?.uid  ? .leading : .trailing)
//        .padding(.horizontal, 10)
//    }
//}
//
//struct MessageBubble_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageBubble(message: FetchedMessagesModel(documentId: "", data: ""))
//    }
//}
