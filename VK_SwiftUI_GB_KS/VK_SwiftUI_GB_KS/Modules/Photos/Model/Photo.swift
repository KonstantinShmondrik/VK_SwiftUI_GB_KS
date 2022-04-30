//
//  Photo.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import Foundation

class Photo: Identifiable {
    
    internal init(photoName: String) {
        self.photoName = photoName
       
    }
    
    let id: UUID = UUID()
    let photoName: String
    
    
}
