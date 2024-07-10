//
//  Comment.swift
//  ANBDCore
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public struct Comment: Codable, Identifiable {
    public let id: String
    public let articleID: String
    
    public let writerID: String
    public var writerNickname: String
    public var writerProfileImageURL: String
    
    public var createdAt: Date
    public var content: String
    
    public init(
        id: String = UUID().uuidString,
        articleID: String,
        writerID: String,
        writerNickname: String,
        writerProfileImageURL: String,
        createdAt: Date = .now,
        content: String
    ) {
        self.id = id
        self.articleID = articleID
        self.writerID = writerID
        self.writerNickname = writerNickname
        self.writerProfileImageURL = writerProfileImageURL
        self.createdAt = createdAt
        self.content = content
    }
}
