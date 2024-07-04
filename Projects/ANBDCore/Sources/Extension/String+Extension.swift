//
//  String+Extension.swift
//  ANBDCore
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public extension String {
    
    func isValidateEmail() -> Bool {
        let emailRegex = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+(?:\.com|\.net|\.co\.kr)"#
        return self.range(of: emailRegex, options: .regularExpression) != nil
    }
    
    func isValidatePassword() -> Bool {
        let passwordRegex = #"^(?!([A-Za-z]+|[~!@#$%^&*()_+=]+|[0-9]+)$)[A-Za-z\d~!@#$%^&*()_+=]{8,16}$"#
        return self.range(of: passwordRegex, options: .regularExpression) != nil
    }
    
    func isValidateNickname() -> Bool {
        let regex = #"^[0-9a-zA-Z가-힣][0-9a-zA-Z가-힣._]{0,18}[0-9a-zA-Z가-힣]$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
}
