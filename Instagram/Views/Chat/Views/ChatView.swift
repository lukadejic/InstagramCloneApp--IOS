//
//  MessagesView.swift
//  Instagram
//
//  Created by MacBook on 8/8/24.
//

import SwiftUI

struct ChatView: View {
    let chatUser : ChatUser?
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    NavigationLink{
                        ChatLogView(chatUser: chatUser)
                    }label: {
                        HStack(spacing: 16) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color(.label), lineWidth: 1)
                                )
                            
                            
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Message sent to user")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.lightGray))
                            }
                            Spacer()
                            
                            Text("22d")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    Divider()
                    .padding(.vertical, 8)
                    
                }.padding(.horizontal)
                
            }.padding(.bottom, 50)
        }
    }
}

#Preview {
    ChatView(chatUser: MockData.chatUser)
}
