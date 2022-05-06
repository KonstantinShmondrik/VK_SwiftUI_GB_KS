//
//  GroupsAPI.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 05.05.2022.
//
// https://api.vk.com/method/METHOD?PARAMS&access_token=TO

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON
import RealmSwift

protocol GroupsService {
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)?)
}

class GroupsAPI: GroupsService {
    
    @ObservedObject var session = Session.shared
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    
    
    
    //    MARK: - DTO
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)? = nil) {
        
        let method = "/groups.get"
        let url = baseUrl + method
        
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version
        ]
        
        params["extended"] = "1"
        params["fields"] = "activity, can_create_topic, can_post, can_see_all_posts, city, contacts;, counters, country, description, finish_date, fixed_post, links, members_count, place, site, start_date, status, verified, wiki_page"
        params["count"] = "50"
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            
            
            self.request = response.request?.description
            
            print("вызов групп пользователя")
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                
                completion?(.success(groups))
            } catch {
                print(error)
            }
        }
    }
}
