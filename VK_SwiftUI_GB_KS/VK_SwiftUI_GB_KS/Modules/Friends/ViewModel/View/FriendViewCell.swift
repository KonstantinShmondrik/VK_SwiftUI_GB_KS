//
//  FriendViewCell.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI

struct FriendViewCell: View {
    
    var friend: Friend
    
    
    var body: some View {
        HStack {
      
                  LogoImageBuilder {
                      Image(friend.friendsLogo)
                  }
                  Spacer()
      
                  NameTextBuilder {
                     Text(friend.friendsName)
                  }
      
              }.padding(10)
          
    }
}

struct FriendViewCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
