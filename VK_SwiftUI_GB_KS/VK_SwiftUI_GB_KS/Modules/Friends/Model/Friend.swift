//
//  Friends.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import Foundation

class Friend: Identifiable {
    
    internal init(friensName: String, friendsLogo: String, photo: [Photo]) {
        self.friendsName = friensName
        self.friendsLogo = friendsLogo
        self.photo = photo
    }
    
    let id: UUID = UUID()
    let friendsName: String
    let friendsLogo: String
    let photo: [Photo]
    
}
