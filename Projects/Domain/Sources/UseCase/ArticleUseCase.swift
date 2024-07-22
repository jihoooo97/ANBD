//
//  ArticleUseCase.swift
//  Domain
//
//  Created by 유지호 on 7/19/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation

public protocol ArticleUseCase {
    func fetchArticle(id: String) async throws -> Article
    func fetchArticleList(_ category: ArticleCategory) async throws -> [Article]
    func writeArticle(_ article: Article) async throws
}

public final class ArticleUseCaseImpl: ArticleUseCase {
    
    private let articleRepository: ArticleRepository
    
    
    public init(articleRepository: ArticleRepository) {
        self.articleRepository = articleRepository
    }
    
    
    public func fetchArticle(id: String) async throws -> Article {
        try await articleRepository.fetchArticle(id: id)
    }
    
    public func fetchArticleList(_ category: ArticleCategory) async throws -> [Article] {
        try await articleRepository.fetchArticleList(category)
    }
    
    public func writeArticle(_ article: Article) async throws {
        try await articleRepository.writeArticle(article)
    }
    
}
