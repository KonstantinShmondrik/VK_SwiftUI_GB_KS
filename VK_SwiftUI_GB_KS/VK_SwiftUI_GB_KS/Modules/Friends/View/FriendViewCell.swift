//
//  FriendViewCell.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct FriendViewCell: View {
    
    var friend: Friend
   
    var body: some View {
        HStack {
      
                  LogoImageBuilder {
                      WebImage(url: URL(string: friend.photo100 ?? ""))
                      
//                      Image("Lucy")
                  }
                  Spacer()
      
                  NameTextBuilder {
                      Text("\((friend.firstName )) \(friend.lastName )")
                  }
      
              }.padding(10)
          
    }
}

//struct FriendViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView(viewModel: FriendsViewModel(api: FriendsAPI()))
//    }
//}
