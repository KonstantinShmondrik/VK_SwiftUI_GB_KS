//
//  Group.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import Foundation
import RealmSwift

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
class Group: Object, Codable, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var isClosed: Int = 0
    @objc dynamic var isAdvertiser: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var isMember: Int = 0
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo200: String = ""
    @objc dynamic var activity: String = "N/A"
    @objc dynamic var isAdmin: Int = 0
    @objc dynamic var photo100: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var screenName: String = ""
    
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
    override static func primaryKey() -> String? {
        return "id"
    }
}
