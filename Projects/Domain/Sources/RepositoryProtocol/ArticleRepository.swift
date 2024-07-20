//
//  ArticleRepository.swift
//  Domain
//
//  Created by 유지호 on 7/19/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol ArticleRepository {
    func fetchArticle(id: String) async throws -> Article
    func fetchArticleList(_ category: ArticleCategory) async throws -> [Article]
    func writeArticle(_ article: Article) async throws
    func updateArticle(_ article: Article) async throws
    func deleteArticle(id: String) async throws
}
