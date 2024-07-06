//
//  CoordinatorScene.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

public typealias Sceneable = Identifiable & Hashable

public enum AuthScene: Sceneable {
    case login
    case signUpEmail
    case signUpPassword
    case signUpNickname
    case signUpTerms
    case termsDetail(TermsType)
    
    public var id: String { "\(self)" }
}

public enum TabScene: Sceneable {
    case tab
    case home
    case article, articleDetail
    case trade, tradeDetail
    case chatList, chatRoom
    case profile
    
    public var id: String { "\(self)" }
}
