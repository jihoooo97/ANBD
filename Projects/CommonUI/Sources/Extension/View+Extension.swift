//
//  View+Extension.swift
//  CommonUI
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public extension View {
    
    func anbdFont(_ font: ANBDFont) -> some View {
        modifier(FontModifier(font))
    }
    
}
