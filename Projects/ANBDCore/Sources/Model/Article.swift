//
//  Article.swift
//  ANBDCore
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public typealias PostableCategory = Categorial & CaseIterable

public protocol Postable: Codable, Identifiable, Hashable {
    var id: String { get }
    var writerID: String { get }
    var writerNickname: String { get }
    var createdAt: Date { get }
    var title: String { get }
    var content: String { get }
    var thumbnailImagePath: String { get }
//    var imagePaths: [String] { get }
}

public struct Article: Postable {
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
    
    public static let `default` = Article(
        id: "",
        writerID: "",
        writerNickname: "작성자명",
        createdAt: .now,
        category: .accua,
        title: "제목",
        content: "내용",
        thumbnailImagePath: "",
        imagePaths: [],
        likeCount: 0,
        commentCount: 0
    )
}
