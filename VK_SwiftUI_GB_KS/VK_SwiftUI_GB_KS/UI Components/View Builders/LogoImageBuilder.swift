//
//  LogoImage.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI

struct LogoImageBuilder: View {
    
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 80, height: 80 )
            .aspectRatio(contentMode: .fill)
            .cornerRadius(40)
            .modifier(CircleShadowModifier(shadowColor: .black, shadowRadius: 8, x: 4, y: 4))
        
    }
}

