//
//  ArticleDetailViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class ArticleDetailViewModel: BaseViewModel<TabCoordinator> {
    
    private let commentUseCase: CommentUseCase
    
    @Published private(set) var article: Article
    @Published private(set) var commentList: [Comment] = []
    
    
    public init(coordinator: TabCoordinator, commentUseCase: CommentUseCase, article: Article) {
        self.commentUseCase = commentUseCase
        self.article = article
        super.init(coordinator: coordinator)
    }
    
    
    func fetchCommentList() async {
        do {
            let commentList = try await commentUseCase.fetchCommentList(article.id)
            
            await MainActor.run {
                self.commentList = commentList
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func writeComment(content: String) async {
        guard !content.isEmpty,
              let userID = UserDefaultsManager.uid
//              let nickname = UserDefaultsManager.nickname
//              let profileImage = UserDefaultsManager.profileImage
        else { return }
        
        do {
            let comment = Comment(
                articleID: article.id,
                writerID: userID,
                writerNickname: "jito",
                writerProfileImageURL: "https://firebasestorage.googleapis.com/v0/b/anbd-project3.appspot.com/o/Profile%2FDefaultUserProfileImage.png?alt=media&token=fc0e56d9-6855-4ead-ab28-d8ff789799b3",
                content: content
            )
            try await commentUseCase.writeComment(comment)
            await fetchCommentList()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
