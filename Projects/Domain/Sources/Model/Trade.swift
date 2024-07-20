//
//  Trade.swift
//  ANBDCore
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation

public struct Trade: Postable {
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
    public let thumbnailImageURL: String
    public let imageURLs: [String]
    
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
        thumbnailImageURL: String,
        imageURLs: [String] = []
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
        self.thumbnailImageURL = thumbnailImageURL
        self.imageURLs = imageURLs
    }
    
    public static let `default` = Trade(
        id: "",
        writerID: "",
        writerNickname: "작성자명",
        createdAt: .now,
        category: .nanua,
        itemCategory: "카테고리",
        location: "서울",
        tradeState: .trading,
        title: "제목",
        content: "내용",
        myProduct: "나의 물건",
        wantProduct: "원하는 물건",
        thumbnailImageURL: ""
    )
}
