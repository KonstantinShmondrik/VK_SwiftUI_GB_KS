//
//  GroupsViewModel.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 05.05.2022.
//

import SwiftUI


class GroupsViewModel: ObservableObject {
    
   
    
    let api: GroupsService
    let objectWillChange = ObjectWillChangePublisher()
    
    @Published var groups: [Group] = []
    
    init(api: GroupsService) {
        self.api = api
    }
    
    
    public func fetch() {
        
        api.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups
        }
    }
}
