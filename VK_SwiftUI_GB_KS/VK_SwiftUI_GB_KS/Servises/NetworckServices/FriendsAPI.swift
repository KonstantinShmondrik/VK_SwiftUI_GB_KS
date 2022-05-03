//
//  FriendsAPI.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 02.05.2022.
//

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import SwiftUI

protocol FriendService {
    func getFriends(completion: @escaping (FriendsContainer?) -> ())
}

class FriendsAPI: FriendService {

    @ObservedObject var session = Session.shared
    
//    var request: String?
//
//    let baseUrl = "https://api.vk.com/method"
//
//    func getFriends(completion: @escaping (FriendsContainer?) -> ()) {
//
//        let method = "/friends.get"
//        let parameters: [String : Any] = [
//            "user_id": session.userId,
//            "order": "name",
//            "count": "1000",
//            "fields": "photo_200, photo_100, photo_50, city, domain",
//            "client_id": session.cliendId,
//            "access_token": session.token,
//            "v": session.version
//        ]
//
//        let url = baseUrl + method
//
//        AF.request(url, method: .get, parameters: parameters).responseData {response in
//            print("вызов списка друзей")
//            //            print(response.result)
//            print(response.data?.prettyJSON)
//
//            self.request = response.request?.description
//
//            guard let jsonData = response.data else { return }
//
//            do {
//                var friendsContainer: FriendsContainer
//                friendsContainer = try JSONDecoder().decode(FriendsContainer.self, from: jsonData)
//
//                let friends = friendsContainer
//
//                completion(friends)
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    
    func getFriends(completion: @escaping (FriendsContainer?) -> ()) {
        let method = "/friends.get"
        let url = baseUrl + method
        
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version,
        ]
        
        params["extended"] = "1"
        params["fields"] = "photo_100,online,sex,last_seen"
        
        AF.request(url, method: .get, parameters: params).responseData{ response in
            self.request = response.request?.description
            
            guard let data = response.data else { return }
            
            do {
                var friends: FriendsContainer
                friends = try JSONDecoder().decode(FriendsContainer.self, from: data)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    
    
    
}
