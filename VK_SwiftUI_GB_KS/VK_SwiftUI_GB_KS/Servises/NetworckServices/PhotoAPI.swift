//
//  PhotoAPI.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 03.05.2022.
//


//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

import Foundation
import Alamofire
import SwiftUI


protocol PhotosService {
    func getPhotos(userId: Int, completion: @escaping([Photos])->())
}

class PhotosAPI: PhotosService {
    
    @ObservedObject var session = Session.shared
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
   

    // MARK: - DTO Вызов фото друзей
    func getPhotos(userId: Int, completion: @escaping([Photos])->()) {
        let method = "/photos.getAll"
        let url = baseUrl + method
        
            self.params = [
            "owner_id": ("\(userId)"),
            "access_token": session.token,
            "v": session.version
        ]
        params["count"] = "100"
        
        
        AF.request(url, method: .get, parameters: params).responseData {response in
            self.request = response.request?.description
            print("вызов всех фотографий пользователя")
            //            print(response.result)
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
            let allPhotoContainer = try JSONDecoder().decode(AllPhotoContainer.self, from: jsonData)

                let photos = allPhotoContainer.response.items

                completion(photos)
            } catch {
                print(error)
            }
        }
    }
}

