//
//  LogoImage.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct LogoImageBuilder: View {
    
    var content: WebImage
    
    @State private var isScaled = false

    init(@ViewBuilder content: () -> WebImage) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 80, height: 80 )
            .aspectRatio(contentMode: .fill)
            .cornerRadius(40)
            .modifier(CircleShadowModifier(shadowColor: .black,
                                           shadowRadius: 8,
                                           x: 4,
                                           y: 4))
            .scaleEffect(isScaled ? 1.5 : 1.0)
            .onTapGesture {
                withAnimation(.spring(response: 0.55,
                                      dampingFraction: 0.8,
                                      blendDuration: 0.5)) {
                    self.isScaled.toggle()
                }
                self.isScaled.toggle()
            }
        
    }
    
}

