//
//  FriendsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI


// MARK: Content
struct FriendsView: View {


    @ObservedObject var viewModel: FriendsViewModel
//    @ObservedObject var viewModelPhoto: PhotosViewModel
   
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
       
    }
    
    var body: some View {
        List(viewModel.friends
//            .sorted(by: { $0.lastName ?? "" ?? "" < $1.lastName })
        )
        { friend in
            NavigationLink(destination: FriendPhotosView(friend: friend, viewModel: PhotosViewModel(userId: friend, api: PhotosAPI() ))) {
                FriendViewCell(friend: friend)
            }
            
        }
        .onAppear { viewModel.fetch() }
        
        
        
        
//        List(friends.sorted(by: { $0.friendsName < $1.friendsName})) { friend in
//            NavigationLink(destination: FriendPhotosView(friend: friend)) {
//                FriendViewCell(friend: friend)
//            }
//        }
//        .navigationBarTitle("Друзья", displayMode: .inline)
            
    }
}


// MARK:  Previews
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
//        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
    }
}


