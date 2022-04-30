//
//  GroupsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI



// MARK: Content
struct GroupsViewCell: View {
    var group: Group
    
    var body: some View {
        HStack {
            
            LogoImageBuilder {
                Image(group.groupsLogo)
            }
            Spacer()
            
            NameTextBuilder {
                Text(group.groupssName)
            }
            
        }.padding(10)
           
    }
}

// MARK:  Previews
struct GroupsViewCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
