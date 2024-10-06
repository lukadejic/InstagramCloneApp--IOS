//
//  SearchBardView.swift
//  Instagram
//
//  Created by MacBook on 8/5/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var value : String
    @State var isSearching = false
    
    var body: some View {
        HStack{
            TextField("Search users here", text: $value)
                .padding(.horizontal, 24)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(6)
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
        .overlay{
            HStack{
                Image(systemName: "magnifyingglass")
                
                Spacer()
                
                Button{
                    self.value = ""
                }label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
            .foregroundStyle(.gray)
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    SearchBarView(value: .constant(""))
}
