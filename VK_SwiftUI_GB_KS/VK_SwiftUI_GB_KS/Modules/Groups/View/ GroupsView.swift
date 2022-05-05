//
//   GroupsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI

struct GroupsView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.groups.sorted(by: {$0.name < $1.name})) { group in
            GroupsViewCell(group: group)
        }
        .onAppear { viewModel.fetch() }
        //        .navigationBarTitle("Группы", displayMode: .inline)
        
    }
}

struct _GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView(viewModel: GroupsViewModel(api: GroupsAPI()))
    }
}
