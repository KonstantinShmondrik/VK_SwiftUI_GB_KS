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

protocol FriendsService {
    func getFriends(completion: @escaping (FriendsContainer?) -> ())
}


class FriendsAPI: FriendsService {
    
    @ObservedObject var session = Session.shared
    
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
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            self.request = response.request?.description
            print(response.data?.prettyJSON)
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
