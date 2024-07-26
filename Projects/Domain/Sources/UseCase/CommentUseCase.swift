//
//  CommentUseCase.swift
//  Domain
//
//  Created by 유지호 on 7/25/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol CommentUseCase {
    func fetchCommentList(_ articleID: String) async throws -> [Comment]
    func writeComment(_ comment: Comment) async throws
    func updateComment(_ comment: Comment) async throws
    func deleteComment(id: String) async throws
}

public final class CommentUseCaseImpl: CommentUseCase {
    private let commentRepository: CommentRepository
    
    
    public init(commentRepository: CommentRepository) {
        self.commentRepository = commentRepository
    }
    
    
    public func fetchCommentList(_ articleID: String) async throws -> [Comment] {
        try await commentRepository.fetchCommentList(articleID: articleID)
    }
    
    public func writeComment(_ comment: Comment) async throws {
        try await commentRepository.writeComment(comment)
    }
    
    public func updateComment(_ comment: Comment) async throws {
        try await commentRepository.updateComment(comment)
    }
    
    public func deleteComment(id: String) async throws {
        try await commentRepository.deleteComment(id: id)
    }
    
}
