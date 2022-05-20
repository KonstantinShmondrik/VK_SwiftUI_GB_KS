//
//  LikeButton.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 20.05.2022.
//

import SwiftUI

struct LikeButton: View {
    
    @State private var isLiked = false
    @State private var likesCount: Int = Int.random(in: 9...999)
    
    var body: some View {
        
        HStack{
            ZStack {
                Image(systemName: "heart.fill")
                   
                    .scaleEffect(isLiked ? 1.0 : 0.0)
                
                Image(systemName: "heart")
                    .foregroundColor(.red)
            }
            .foregroundColor(isLiked ? .red : .white)
            
            Text("\(likesCount)")
                .transition(.opacity.animation(.easeInOut(duration: 0.35)))

        }
        .font(.system(size: 20))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.25)) {
                isLiked.toggle()
                likesCount += isLiked ? 1 : -1
            }
        }
    }
}
    
    
    struct LikeButton_Previews: PreviewProvider {
        static var previews: some View {
            LikeButton()
        }
    }
