//
//  SelectionRectangle.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 29.05.2022.
//

import SwiftUI

struct SelectionRectangle: View {
    let anchor: Anchor<CGRect>?
    
    
    var body: some View {
        GeometryReader { proxy in
            if let rect = self.anchor.map( { proxy[$0] }) {
                Rectangle()
                    .fill(Color.clear)
                    .border(Color.blue, width: 2)
                    .offset(x: rect.minX, y: rect.minY)
                    .frame(width: rect.width, height: rect.height)
            }
        }
    }
       
}

