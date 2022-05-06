//
//  Realm.Configuration+Ext.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 05.05.2022.
//

import RealmSwift

extension Realm.Configuration {
   
   
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
}



