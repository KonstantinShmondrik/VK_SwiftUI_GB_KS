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
    
    init(photo: Photos) {
        self.photo = photo
    }
    
    @State private var likeName = ""
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                WebImage(url: URL(string: photo.sizes.last?.url ?? ""))
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .frame(width: proxy.size.width)
                
                Spacer()
                LikeButton()
                    .frame(width: proxy.size.width)
            }
            
            .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width)
        }
    }
}
//
//struct PhotosViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosViewCell()
//    }
//}
