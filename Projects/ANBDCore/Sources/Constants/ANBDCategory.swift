//
//  ANBDCategory.swift
//  ANBDCore
//
//  Created by 유지호 on 7/8/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public protocol Categorial: Codable, Hashable, Identifiable {
    var name: String { get }
    var id: String { get }
}

public enum ANBDCategory: Categorial {
    case article(ArticleCategory)
    case trade(TradeCategory)
    
    public var key: Int {
        switch self {
        case .article(let category):
            category.rawValue
        case .trade(let category):
            category.rawValue
        }
    }
    
    public var name: String {
        switch self {
        case .article(let category):
            category.name
        case .trade(let category):
            category.name
        }
    }
    
    public var id: String {
        switch self {
        case .article(let category): category.id
        case .trade(let category):   category.id
        }
    }
}

public enum ArticleCategory: Int, Categorial, CaseIterable {
    case accua = 0
    case dasi  = 3
    
    public var name: String {
        switch self {
        case .accua: "아껴쓰기"
        case .dasi:  "다시쓰기"
        }
    }
    
    public var id: String { "\(self)" }
}

public enum TradeCategory: Int, Categorial, CaseIterable {
    case nanua  = 1
    case baccua = 2
    
    public var name: String {
        switch self {
        case .nanua:  "나눠쓰기"
        case .baccua: "바꿔쓰기"
        }
    }
    
    public var id: String { "\(self)" }
}
