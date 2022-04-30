//
//  ContainerView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.04.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedInn: $shouldShowMainView)
                NavigationLink(destination: TabBarView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
            }
        }
    }
}

