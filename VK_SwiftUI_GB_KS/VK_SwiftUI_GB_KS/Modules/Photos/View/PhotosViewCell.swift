//
//  PhotosViewCell.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 30.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct PhotosViewCell: View {
    
    var photo: Photos
    
    var body: some View {
        
        GeometryReader { proxy in
            
            WebImage(url: URL(string: photo.sizes.last?.url ?? ""))
            
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
//                .aspectRatio(contentMode: .fill)
                .frame(width: proxy.size.width, height: proxy.size.height,  alignment: .center)
               
        }
    }
}

//struct PhotosViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosViewCell()
//    }
//}
