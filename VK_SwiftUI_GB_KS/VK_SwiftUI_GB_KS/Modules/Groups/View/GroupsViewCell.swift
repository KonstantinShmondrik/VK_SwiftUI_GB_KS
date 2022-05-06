//
//  GroupsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI



// MARK: Content
struct GroupsViewCell: View {
    var group: Group
    
    var body: some View {
        HStack {
            
            LogoImageBuilder {
                WebImage(url: URL(string: group.photo100))
            }
            Spacer()
            
            NameTextBuilder {
                Text(group.name)
            }
            
        }.padding(10)
        
    }
}
//
//// MARK:  Previews
//struct GroupsViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsView(viewModel: GroupsViewModel(api: GroupsAPI()))
//    }
//}
