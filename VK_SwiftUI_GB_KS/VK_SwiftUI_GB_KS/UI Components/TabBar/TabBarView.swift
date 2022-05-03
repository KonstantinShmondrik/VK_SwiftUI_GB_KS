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
            
            FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.2.circle")
                    Text("Друзья")
                }
            
            GroupsView()
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Группы")
                    
                }
            NewsView()
                .navigationBarTitle("", displayMode: .inline)
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Новости")
                }
        }
        .navigationBarBackButtonHidden(true) // если не хотим переходить на страницу логина
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
