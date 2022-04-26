//
//  GroupsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI

var groupName = Text("Волшебный лес")
var GroupLogo = Image("Forest")

// MARK: Content
struct GroupsView: View {
    var body: some View {
        HStack {
            
            LogoImageBuilder {
                GroupLogo
            }
            Spacer()
            
            NameTextBuilder {
                groupName
            }
            
        }.padding(10)
        
    }
}

// MARK:  Previews
struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
