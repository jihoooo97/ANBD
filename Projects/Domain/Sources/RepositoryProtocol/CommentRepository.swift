//
//  CommentRepository.swift
//  Domain
//
//  Created by 유지호 on 7/25/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol CommentRepository {
    func fetchCommentList(articleID: String) async throws -> [Comment]
    func writeComment(_ comment: Comment) async throws
    func updateComment(_ comment: Comment) async throws
    func deleteComment(id: String) async throws
}
