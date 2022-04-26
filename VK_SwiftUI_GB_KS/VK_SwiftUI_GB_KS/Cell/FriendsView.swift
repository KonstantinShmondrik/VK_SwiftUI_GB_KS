//
//  FriendsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI

var friendsName = Text("Люцик")
var friendsLogo = Image("Lucy")


// MARK: Content
struct FriendsView: View {
    var body: some View {
        
        HStack {
            
            LogoImageBuilder {
                friendsLogo
            }
            Spacer()
            
            NameTextBuilder {
                friendsName
            }
            
        }.padding(10)
    }
}


// MARK:  Previews
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


