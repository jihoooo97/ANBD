//
//  ArticleDetailViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation

public final class ArticleDetailViewModel: BaseViewModel<TabCoordinator> {
    private let storageService: StorageServiceInterface = StorageService()
    
    @Published private(set) var article: Article
    @Published private(set) var imageURLs: [URL] = []
    @Published private(set) var commentList: [Comment] = []
    
    
    public init(coordinator: TabCoordinator, article: Article) {
        self.article = article
        super.init(coordinator: coordinator)
    }
    
    
    func fetchImageList() async {
        guard !article.imagePaths.isEmpty else { return }
        
        do {
            let urls = try await storageService.downloadImageList(path: .article, id: article.id)
            
            await MainActor.run {
                imageURLs = urls
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchCommentList() async {
        do {
            let documentsSnapshot = try await FireStoreDB.comment
                .whereField("articleID", isEqualTo: article.id)
                .order(by: "createdAt")
                .getDocuments()
                .documents
            
            let commentList = documentsSnapshot.compactMap { try? $0.data(as: Comment.self) }
            
            await MainActor.run {
                self.commentList = commentList
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
