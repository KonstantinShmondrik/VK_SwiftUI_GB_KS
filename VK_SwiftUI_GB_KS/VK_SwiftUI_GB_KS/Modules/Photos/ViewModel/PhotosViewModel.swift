//
//  PhotosViewModel.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 03.05.2022.
//

import SwiftUI


class PhotosViewModel: ObservableObject {
    
    let api: PhotosService
    let friend: Friend
    
    @Published var photos: [Photos] = []
    
    init(friend: Friend, api: PhotosService) {
        self.friend = friend
        self.api = api
    }
    
    public func fetch() {
        
        api.getPhotos(userId: friend.id) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
        }
        
    }
}
