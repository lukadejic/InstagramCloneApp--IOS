//
//  HomeView.swift
//  Instagram
//
//  Created by MacBook on 8/1/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session : SessionStore
    
    var body: some View {
        VStack{
            
            Text("Home view")
            
            Button{
                session.logOut()
            }label: {
                Text("Log In")
                    .modifier(ButtonModifier())
            }
        }
    }
}

#Preview {
    HomeView()
}
