//
//  FontModifier.swift
//  CommonUI
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

struct FontModifier: ViewModifier {
    let font: ANBDFont
    
    init(_ font: ANBDFont) {
        self.font = font
    }
    
    func body(content: Content) -> some View {
        content
            .font(ANBDFont.font(font))
    }
}
