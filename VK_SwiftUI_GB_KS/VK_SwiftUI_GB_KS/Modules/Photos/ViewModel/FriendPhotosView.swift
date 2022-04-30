//
//  FriendPhotosView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.04.2022.
//

import SwiftUI

struct FriendPhotosView: View {
    
    var friend: Friend
    
    var body: some View {
        //             Image(friend.friendsLogo)
        
        List(friend.photo) {photo in
            PhotosViewCell(photo: photo)
        }
        .navigationBarTitle(friend.friendsName, displayMode: .inline)
    }
}


//struct FriendPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotosView()
//    }
//}
