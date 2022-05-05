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
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
        
    }
    
    var body: some View {
        List(viewModel.friends
             //            .sorted(by: { $0.lastName ?? "" ?? "" < $1.lastName })
        )
        { friend in
            NavigationLink(destination: FriendPhotosView(viewModel: PhotosViewModel(friend: friend, api: PhotosAPI() ))) {
                FriendViewCell(friend: friend)
            }
            
        }
        .onAppear { viewModel.fetch() }
        
    }
}


// MARK:  Previews
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
    }
}


