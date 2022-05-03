//
//  FriendPhotosView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.04.2022.
//

import SwiftUI
import ASCollectionView
import SDWebImageSwiftUI

struct FriendPhotosView: View {
    
    @ObservedObject var viewModel: PhotosViewModel
    var friend: Friend
    
    init(friend: Friend, viewModel: PhotosViewModel) {
        self.friend = friend
        self.viewModel = viewModel
    }
    
    var body: some View {
       

        ASCollectionView(data: viewModel.photos) {(photo, context) in
            return PhotosViewCell(photo: photo)
        }.layout {
            .grid(layoutMode: .fixedNumberOfColumns(2),
                  itemSpacing: 10,
                  lineSpacing: 10)
        }
        .onAppear { viewModel.fetch() }
        .navigationBarTitle("\((friend.firstName )) \(friend.lastName )", displayMode: .inline)
       
    }
}


//struct FriendPhotosView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendPhotosView(friend: Friend(), viewModel: PhotosViewModel(userId: Friend(), api: PhotosAPI()))
//    }
//}
