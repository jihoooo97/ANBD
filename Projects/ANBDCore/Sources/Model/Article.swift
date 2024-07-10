//
//  Article.swift
//  ANBDCore
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public struct Article: Codable, Identifiable, Hashable {
    public let id: String
    public let writerID: String
    public let writerNickname: String
    public let createdAt: Date
    public let category: ArticleCategory
    public let title: String
    public let content: String
    public let thumbnailImagePath: String
    public let imagePaths: [String]
    public let likeCount: Int
    public let commentCount: Int
    

    public init(
        id: String = UUID().uuidString,
        writerID: String,
        writerNickname: String,
        createdAt: Date = .now,
        category: ArticleCategory,
        title: String,
        content: String,
        thumbnailImagePath: String,
        imagePaths: [String] = [],
        likeCount: Int = 0,
        commentCount: Int = 0
    ) {
        self.id = id
        self.writerID = writerID
        self.writerNickname = writerNickname
        self.createdAt = createdAt
        self.category = category
        self.title = title
        self.content = content
        self.thumbnailImagePath = thumbnailImagePath
        self.imagePaths = imagePaths
        self.likeCount = likeCount
        self.commentCount = commentCount
    }
}
