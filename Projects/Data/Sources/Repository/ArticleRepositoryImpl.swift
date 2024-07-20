//
//  ArticleRepository.swift
//  Data
//
//  Created by 유지호 on 7/19/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class ArticleRepositoryImpl: ArticleRepository {
    
    private let articleDB = FireStoreDB.article
    
    
    public init() { }
    
    
    public func fetchArticle(id: String) async throws -> Article {
        let article = try await articleDB
            .document(id)
            .getDocument()
            .data(as: Article.self)
        return article
    }
    
    public func fetchArticleList(_ category: ArticleCategory) async throws -> [Article] {
        let documentSnapshots = try await articleDB
            .whereField("category", isEqualTo: category.rawValue)
            .order(by: "createdAt", descending: true)
            .getDocuments()
            .documents
        
        let articleList = documentSnapshots.compactMap { try? $0.data(as: Article.self) }
        return articleList
    }
    
    public func writeArticle(_ article: Article) async throws {
        try articleDB.document("\(article.id)").setData(from: article)
        
    }
    
    public func updateArticle(_ article: Article) async throws {
        try await articleDB.document(article.id).setData([
            "category": article.category.rawValue,
            "title": article.title,
            "content": article.content,
            "thumbnailImageURL": article.thumbnailImageURL,
            "imageURLs": article.imageURLs,
            "likeCount": article.likeCount,
            "commentCount": article.commentCount
        ])
    }
    
    public func deleteArticle(id: String) async throws {
        try await articleDB.document(id).delete()
    }
    
}
