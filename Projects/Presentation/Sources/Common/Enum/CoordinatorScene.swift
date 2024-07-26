//
//  CoordinatorScene.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

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
    case homeDetail(ANBDCategory)
    
    case article(ArticleCategory)
    case articleDetail(Article)
    case articleEdit(ArticleCategory, Article?)
    
    case trade(TradeCategory)
    case tradeDetail(Trade)
    case tradeEdit(TradeCategory, Trade?)
    
    case chatList, chatRoom
    case profile(id: String)
    
    public var id: String { "\(self)" }
}
