//
//  NameTextBuilder.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 26.04.2022.
//

import SwiftUI

struct NameTextBuilder: View {
    
    var content: Text
    
    init(@ViewBuilder content: () -> Text) {
        self.content = content()
    }
    
    var body: some View {
        content
            .font(.system(size: 16))
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 250, height: 80, alignment: .leading)
    }
}
