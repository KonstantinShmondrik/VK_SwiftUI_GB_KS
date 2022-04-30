//
//  FriendsView.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI


// MARK: Content
struct FriendsView: View {
    
    
    @State private var friends: [Friend] = [
        Friend(friensName: "Люцик",
               friendsLogo: "Lucy",
               photo: [Photo(photoName: "Lucy"),
                       Photo(photoName: "Bar")
                      ]),
        Friend(friensName: "Зог",
               friendsLogo: "Zog",
               photo: [Photo(photoName: "Zog"),
                       Photo(photoName: "Elfud")
                      ]),
        Friend(friensName: "Тиабини",
               friendsLogo: "Tiabiny",
               photo: [Photo(photoName: "Elfud"),
                       Photo(photoName: "Tiabiny")
                      ]),
        Friend(friensName: "Уна",
               friendsLogo: "Una",
               photo: [Photo(photoName: "Forest"),
                       Photo(photoName: "Una")
                      ]),
        Friend(friensName: "Эльфо",
               friendsLogo: "Elfo",
               photo: [Photo(photoName: "Forest"),
                       Photo(photoName: "Elfo")
                      ])
    ]
    
    var body: some View {
        
        List(friends.sorted(by: { $0.friendsName < $1.friendsName})) { friend in
            NavigationLink(destination: FriendPhotosView(friend: friend)) {
                FriendViewCell(friend: friend)
            }
        }
        .navigationBarTitle("Друзья", displayMode: .inline)
    }
}


// MARK:  Previews
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


