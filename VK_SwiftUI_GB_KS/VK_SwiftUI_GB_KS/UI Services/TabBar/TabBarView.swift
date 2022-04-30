//
//  TabBarView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.circle")
                    Text("Друзья")
                }
            
            GroupsView()
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Группы")
                    
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Новости")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
