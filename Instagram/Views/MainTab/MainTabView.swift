//
//  MainTabView.swift
//  Instagram
//
//  Created by MacBook on 8/1/24.
//

import SwiftUI

struct MainTabView: View {
   
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "house") }
                .tag(0)
            
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            PageView()
                .tabItem { Image(systemName: "camera.viewfinder") }
                .tag(2)
            
            NotificationView()
                .tabItem { Image(systemName: "heart.fill") }
                .tag(3)
            
            ProfileView()
                .tabItem { Image(systemName: "person.fill")}
                .tag(4)

        }
        .tint(.primary)

    }
}

#Preview {
    MainTabView()
        .environmentObject(SessionStore())
}
