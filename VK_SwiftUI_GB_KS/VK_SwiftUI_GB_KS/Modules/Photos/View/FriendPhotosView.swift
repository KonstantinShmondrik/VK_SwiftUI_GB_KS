//
//  FriendPhotosView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.04.2022.
//

import SwiftUI
import ASCollectionView

struct FriendPhotosView: View {
    
    var friend: Friend
    
    var body: some View {
        //             Image(friend.friendsLogo)
        
        ASCollectionView(data: friend.photo) {(photo, context) in
            return PhotosViewCell(photo: photo)
        }.layout {
            .grid(layoutMode: .fixedNumberOfColumns(2),
                  itemSpacing: 10,
                  lineSpacing: 10)
        }
        .navigationBarTitle(friend.friendsName, displayMode: .inline)
       
    }
}


//struct FriendPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotosView(friend: <#Friend#>)
//    }
//}
