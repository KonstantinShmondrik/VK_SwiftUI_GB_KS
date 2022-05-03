//
//  PhotosViewModel.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 03.05.2022.
//

import SwiftUI


class PhotosViewModel: ObservableObject {
    
    let api: PhotoService
    let userId: Friend
    
    @Published var photos: [Photos] = []
    
    init(userId: Friend, api: PhotoService) {
        self.userId = userId
        self.api = api
    }
    
    public func fetch() {
        
        api.getPhotos(userId: userId.id) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
        }
        
    }
}
