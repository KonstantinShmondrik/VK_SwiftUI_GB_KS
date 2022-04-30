//
//  Group.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import Foundation

class Group: Identifiable {
    
    internal init(groupsName: String, groupsLogo: String) {
        self.groupssName = groupsName
        self.groupsLogo = groupsLogo
    }
    
    let id: UUID = UUID()
    let groupssName: String
    let groupsLogo: String
    
}
