//
//  Group.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import Foundation

// MARK: - GroupContainer
struct GroupContainer: Codable {
    let response: GroupsResponse
}

// MARK: - Response
struct GroupsResponse: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable, Identifiable {
    let id, isClosed, isAdvertiser: Int
    let type: String?
    let isMember: Int
    let photo50, photo200: String
    let activity: String?
    let isAdmin: Int
    let photo100: String
    let name, screenName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case isAdvertiser = "is_advertiser"
        case type
        case isMember = "is_member"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case activity
        case isAdmin = "is_admin"
        case photo100 = "photo_100"
        case name
        case screenName = "screen_name"
    }
}
