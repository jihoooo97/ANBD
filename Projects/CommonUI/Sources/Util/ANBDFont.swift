//
//  ANBDFont.swift
//  CommonUI
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public enum ANBDFont {
    case heading1, heading2, heading3
    case subtitle1, subtitle2, subtitle3
    case caption1, caption2, caption3
    case body1, body2
    
    var size: CGFloat {
        switch self {
        case .heading1:  return 48
        case .heading2:  return 36
        case .heading3:  return 24
        case .subtitle1: return 18
        case .subtitle2: return 16
        case .subtitle3: return 14
        case .caption1:  return 14
        case .caption2:  return 12
        case .caption3:  return 10
        case .body1:     return 16
        case .body2:     return 14
        }
    }
    
    var name: String {
        switch self {
        case .heading1: 
            "Pretendard-Bold"
        case .subtitle1, .subtitle2, .subtitle3: 
            "Pretendard-SemiBold"
        case .heading2, .heading3:
            "Pretendard-Medium"
        default:
            "Pretendard-Regular"
        }
    }
    
    static func font(_ font: ANBDFont) -> Font {
        return .custom(font.name, size: font.size)
    }
}
