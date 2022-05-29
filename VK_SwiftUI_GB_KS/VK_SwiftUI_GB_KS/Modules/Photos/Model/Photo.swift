//
//  Photo.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI
import Foundation

// MARK: - AllPhotoContainer
struct AllPhotoContainer: Codable {
    let response: PhotoResponse
}

// MARK: - Response
struct PhotoResponse: Codable {
    let count: Int
    let items: [Photos]
}

// MARK: - Item
struct Photos: Codable, Identifiable, Equatable {
   
    
    let albumID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int
    let postID: Int?
 

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
        case postID = "post_id"
    }
    
    static func == (lhs: Photos, rhs: Photos) -> Bool {
        if let l = lhs as? Photos, let r = rhs as? Photos {
                return l.id == r.id
            }
            return false
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
