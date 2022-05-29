//
//  PhotoHeightPreferenceKey.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 28.05.2022.
//

import Foundation
import SwiftUI

struct PhotoHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
