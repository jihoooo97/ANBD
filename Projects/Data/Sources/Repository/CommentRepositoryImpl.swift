//
//  CommentRepositoryImpl.swift
//  Data
//
//  Created by 유지호 on 7/25/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import FirebaseFirestore

public final class CommentRepositoryImpl: CommentRepository {
    
    private let commentDB = FireStoreDB.comment
    
    
    public init() { }
    
    
    public func fetchCommentList(articleID: String) async throws -> [Comment] {
        let documentSnapshots = try await commentDB
            .whereField("articleID", isEqualTo: articleID)
            .order(by: "createdAt", descending: false)
            .getDocuments()
            .documents
        
        let commentList = documentSnapshots.compactMap { try? $0.data(as: Comment.self) }
        return commentList
    }
    
    public func writeComment(_ comment: Comment) async throws {
        try commentDB.document("\(comment.id)").setData(from: comment)
    }
    
    public func updateComment(_ comment: Comment) async throws {
        try await commentDB.document(comment.id).setData([
            "writerNickname": comment.writerNickname,
            "writerProfileImageURL": comment.writerProfileImageURL,
            "content": comment.content
        ])
    }
    
    public func deleteComment(id: String) async throws {
        try await commentDB.document(id).delete()
    }
    
}
