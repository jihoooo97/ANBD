//
//  AuthFieldState.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

enum AuthFieldState {
    case empty
    case invalidBoth
    case invalidEmail
    case invalidPassword
    case invalidNickname
    case success
    
    var description: String {
        switch self {
        case .invalidBoth: "잘못된 이메일 또는 비밀번호 형식입니다."
        case .invalidEmail: "잘못된 이메일 형식입니다."
        case .invalidPassword: "영문, 숫자, 특수문자로 구성된 8~16자를 입력해주세요."
        case .invalidNickname: "한글, 영문, 숫자로 구성된 2~20자를 입력해주세요"
        case .empty, .success: ""
        }
    }
}
