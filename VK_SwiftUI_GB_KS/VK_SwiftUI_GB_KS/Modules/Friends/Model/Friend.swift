//
//  Friends.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let friendsContainer = try? newJSONDecoder().decode(FriendsContainer.self, from: jsonData)

import Foundation

// MARK: - FriendsContainer
struct FriendsContainer: Codable {
    let response: FriendsResponse
}

// MARK: - Response
struct FriendsResponse: Codable {
    let count: Int
    let items: [Friend]
}

// MARK: - Item
struct Friend: Codable, Identifiable {
    
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String?
    let online: Int?
    let sex: Int?
    let trackCode: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo100 = "photo_100"
        case online, sex
        case trackCode = "track_code"
    }
}

