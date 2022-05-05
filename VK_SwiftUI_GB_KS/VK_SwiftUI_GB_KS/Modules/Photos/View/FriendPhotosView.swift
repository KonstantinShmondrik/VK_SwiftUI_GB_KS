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
    
    
    init(viewModel: PhotosViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            VStack {
                LogoImageBuilder {
                    WebImage(url: URL(string: viewModel.friend.photo100 ?? ""))
                }
                
                Text("\((viewModel.friend.firstName )) \(viewModel.friend.lastName )")
                    .lineLimit(1)
                    .font(.largeTitle)
            }
            
            ASCollectionView(data: viewModel.photos) {(photo, context) in
                return PhotosViewCell(photo: photo)
            }.layout {
                .grid(layoutMode: .fixedNumberOfColumns(2),
                      itemSpacing: 10,
                      lineSpacing: 10)
            }
            .onAppear { viewModel.fetch() }
            .navigationBarTitle("\((viewModel.friend.firstName )) \(viewModel.friend.lastName )", displayMode: .inline)
        }
    }
}


//struct FriendPhotosView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        FriendPhotosView(viewModel: PhotosViewModel(friend: Friend() , api: PhotosAPI()))
//    }
//}
