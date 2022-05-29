//
//  SelectionsPreferenceKey.swift
//  VK_SwiftUI_GB_KS
//
//  Created by Константин Шмондрик on 28.05.2022.
//

import Foundation
import SwiftUI

struct SelectionsPreferenceKey: PreferenceKey {

    static var defaultValue: Anchor<CGRect>? = nil

    static func reduce(value: inout Anchor<CGRect>?, nextValue: () -> Anchor<CGRect>?) {
        value = value ?? nextValue()
    }
}


