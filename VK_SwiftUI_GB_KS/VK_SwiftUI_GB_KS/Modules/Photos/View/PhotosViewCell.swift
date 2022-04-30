//
//  PhotosViewCell.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI

struct PhotosViewCell: View {
    
    var photo: Photo
 
    var body: some View {
        Image(photo.photoName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100, alignment: .center)
            .aspectRatio(contentMode: .fill)
            
    }
}

//struct PhotosViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosViewCell()
//    }
//}
