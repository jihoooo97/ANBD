//
//  ANBDTab.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

public enum ANBDTab: CaseIterable {
    case home
    case article
    case trade
    case chat
    case profile
    
    var name: String {
        switch self {
        case .home:    "홈"
        case .article: "정보 공유"
        case .trade:   "나눔·거래"
        case .chat:    "채팅"
        case .profile: "내 정보"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:    "house"
        case .article: "leaf"
        case .trade:   "arrow.3.trianglepath"
        case .chat:    "bubble.right"
        case .profile: "person.fill"
        }
    }
}
