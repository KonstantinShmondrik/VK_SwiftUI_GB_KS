//
//  ContainerView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.04.2022.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = false
    @ObservedObject var session = Session.shared
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedInn: $shouldShowMainView)
                NavigationLink(destination: VKLoginWebView(), isActive: $shouldShowMainView) {
                    EmptyView()
                }
                NavigationLink(destination: TabBarView(), isActive: $session.isAuthorized) { EmptyView() }
            }
        }
    }
    
    
    // если хотим избежать листа с кастомной авторизацией
    
    //         var body: some View {
    //             NavigationView {
    //                 HStack {
    //                     VKLoginWebView()
    //                     NavigationLink(destination: TabBarView(), isActive: $session.isAuthorized) { EmptyView() }
    //                 }
    //             }
    //         }
    //
    
    
}

