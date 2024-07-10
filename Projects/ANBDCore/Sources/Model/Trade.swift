//
//  Trade.swift
//  ANBDCore
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public struct Trade: Codable, Identifiable, Hashable {
    public let id: String
    public let writerID: String
    public let writerNickname: String
    public let createdAt: Date
    public let category: TradeCategory
    public let itemCategory: String
    public let location: String
    public let tradeState: TradeState
    public let title: String
    public let content: String
    public let myProduct: String
    public let wantProduct: String?
    public let thumbnailImagePath: String
    public let imagePaths: [String]
    
    public init(
        id: String = UUID().uuidString,
        writerID: String,
        writerNickname: String,
        createdAt: Date = .now,
        category: TradeCategory,
        itemCategory: String,
        location: String,
        tradeState: TradeState = .trading,
        title: String,
        content: String,
        myProduct: String,
        wantProduct: String? = nil,
        thumbnailImagePath: String,
        imagePaths: [String] = []
    ) {
        self.id = id
        self.writerID = writerID
        self.writerNickname = writerNickname
        self.createdAt = createdAt
        self.category = category
        self.itemCategory = itemCategory
        self.location = location
        self.tradeState = tradeState
        self.title = title
        self.content = content
        self.myProduct = myProduct
        self.wantProduct = wantProduct
        self.thumbnailImagePath = thumbnailImagePath
        self.imagePaths = imagePaths
    }
}
