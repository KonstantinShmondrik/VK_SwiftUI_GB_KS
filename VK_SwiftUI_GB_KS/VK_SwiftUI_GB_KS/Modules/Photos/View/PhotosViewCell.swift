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
    let index: Int?
    @Binding var selection: Int?
    
    
    
    @State private var likeName = ""
    
    var body: some View {
        
        return GeometryReader { proxy in
            VStack {
                WebImage(url: URL(string: photo.sizes.last?.url ?? ""))
                    .resizable()
                    .frame(width: proxy.size.width/2, height: proxy.size.width/2)
                    .scaledToFill()
                Spacer().frame(height: 5)
                
                LikeButton()
                    .frame(width: proxy.size.width)
            }
            .aspectRatio(1, contentMode: .fill)
            .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width/1.5)
            .anchorPreference(key: SelectionsPreferenceKey.self, value: .bounds) {
                index == self.selection ? $0 : nil
            }
            .onTapGesture {
                withAnimation(.default) {
                    self.selection = index
                }
            }
        }
    }
}
//
//struct PhotosViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotosViewCell()
//    }
//}
