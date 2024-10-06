//
//  CommentCard.swift
//  Instagram
//
//  Created by MacBook on 8/6/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentCardView: View {
    var comment: Comment
    
    var body: some View {
        HStack{
            WebImage(url: URL(string: comment.profile))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 30, height: 30)
                .shadow(color: .gray, radius: 3)
            
            VStack(alignment: .leading){
                Text(comment.username)
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                Text(comment.comment)
                    .font(.caption)
                
            }
            Spacer()
            
            Text((Date(timeIntervalSince1970:comment.date)).timeAgo() + " ago")
                .font(.subheadline)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    CommentCardView(comment: MockData.comment)
}
