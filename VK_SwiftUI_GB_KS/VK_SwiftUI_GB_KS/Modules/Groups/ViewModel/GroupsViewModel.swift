//
//  GroupsViewModel.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 05.05.2022.
//

import SwiftUI
import RealmSwift


class GroupsViewModel: ObservableObject {
    
    
    
    let api: GroupsService
    let realmService: AnyRealmService
    let objectWillChange = ObjectWillChangePublisher()
    private(set) lazy var groups: Results<Group>? = try? realmService.get(Group.self, configuration: .deleteIfMigration)
    // Копия результата запроса в БД
    var detachedGroups: [Group] { groups?.map { $0.detached() } ?? [] }
    // Токен-обсервер БД
    private var notificationToken: NotificationToken?
    
    
    init(api: GroupsService, realmService: AnyRealmService) {
        self.api = api
        self.realmService = realmService
        
        notificationToken = groups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    public func fetch() {
        print("Groups requested")
        api.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                try? self?.realmService.save(items: groups, configuration: .deleteIfMigration, update: .modified)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    //    public func fetch() {
    //
    //        api.getGroups { [weak self] groups in
    //            guard let self = self else { return }
    //            self.groups = groups
    //        }
    //    }
    
    
    
}
