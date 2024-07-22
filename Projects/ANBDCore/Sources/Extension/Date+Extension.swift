//
//  Date+Extension.swift
//  ANBDCore
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public extension Date {
    
    static var relativeDateTimeFormater: RelativeDateTimeFormatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.locale = .init(identifier: "ko_KR")
        return formatter
    }
    
    var relativeFormat: String {
        let formatter = Date.relativeDateTimeFormater
        let monthGap: TimeInterval = 60 * 60 * 24
        
        if Date.now.timeIntervalSince(self) < 60 {
            return "방금 전"
        } else if Date.now.timeIntervalSince(self) >= monthGap {
            formatter.dateTimeStyle = .numeric
        } else {
            formatter.dateTimeStyle = .named
        }
        
        return formatter.localizedString(for: self, relativeTo: .now)
    }
    
}
