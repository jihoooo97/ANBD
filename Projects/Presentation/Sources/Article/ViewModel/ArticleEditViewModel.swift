//
//  ArticleEditViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/19/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class ArticleEditViewModel: BaseViewModel<TabCoordinator> {
    
    private let useCase: ArticleUseCase
    private let storageService = StorageService.shared
    
    
    public init(coordinator: TabCoordinator, useCase: ArticleUseCase) {
        self.useCase = useCase
        super.init(coordinator: coordinator)
    }
    
    
    func writeArticle(
        _ category: ArticleCategory,
        title: String,
        content: String,
        imageDatas: [Data]
    ) async {
        do {
            var article = Article(
                writerID: "jiho",
                writerNickname: "지호구",
                category: category,
                title: title,
                content: content,
                thumbnailImageURL: ""
            )
            
            let thumbnailURL = try await storageService.uploadImage(path: .article, id: article.id, image: imageDatas[0], name: "thumbnail")
            let imageURLs = try await storageService.uploadImageList(path: .article, id: article.id, images: imageDatas)
            article.thumbnailImageURL = thumbnailURL
            article.imageURLs = imageURLs
            
            try await useCase.writeArticle(article)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
