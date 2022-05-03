//
//   GroupsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @State private var groups: [Group] = [
        Group(groupsName: "Чумная яма", groupsLogo: "Bar"),
        Group(groupsName: "Эльфуд", groupsLogo: "Elfud"),
        Group(groupsName: "Волшебный лес", groupsLogo: "Forest"),
        Group(groupsName: "Дримландя", groupsLogo: "Zog"),
        Group(groupsName: "Дэнкмайр", groupsLogo: "Una")
    ]
    
    var body: some View {
        List(groups.sorted(by: {$0.groupssName < $1.groupssName})) {group in
            GroupsViewCell(group: group)
        }
//        .navigationBarTitle("Группы", displayMode: .inline)
        
    }
}

struct _GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
