//
//  UserDefaultsKey.swift
//  ANBDCore
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public enum UserDefaultsKey {
    case uid
    case email
    case nickname
    case profileImage
    case pushToken
    case lastLoginDate
}

@propertyWrapper
struct UserDefaultsWrapper<T> {
    private let key: UserDefaultsKey
    
    init(_ key: UserDefaultsKey) {
        self.key = key
    }
    
    var wrappedValue: T? {
        get {
            return UserDefaults.standard.object(forKey: "\(key)") as? T
        }
        
        set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "\(key)")
            } else {
                UserDefaults.standard.setValue(newValue, forKey: "\(key)")
            }
        }
    }
}

public struct UserDefaultsManager {
    @UserDefaultsWrapper<String>(.uid) public static var uid
    @UserDefaultsWrapper<String>(.email) public static var email
    @UserDefaultsWrapper<String>(.nickname) public static var nickname
    @UserDefaultsWrapper<String>(.profileImage) public static var profileImage
    @UserDefaultsWrapper<String>(.pushToken) public static var pushToken
    @UserDefaultsWrapper<Date>(.lastLoginDate) public static var lastLoginDate
}
