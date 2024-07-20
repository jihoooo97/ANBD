//
//  ArticleViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class ArticleViewModel: BaseViewModel<TabCoordinator> {
    
    private let useCase: ArticleUseCase
    
    @Published private(set) var accuaList: [Article] = []
    @Published private(set) var dasiList: [Article] = []
    
    
    public init(coordinator: TabCoordinator, useCase: ArticleUseCase) {
        self.useCase = useCase
        super.init(coordinator: coordinator)
    }
    
    
    func fetchArticleList(category: ArticleCategory) async {
        print("fetch \(category.name)")
        do  {
            let articleList = try await useCase.fetchArticleList(category)
            
            await MainActor.run {
                switch category {
                case .accua:
                    self.accuaList = articleList
                case .dasi:
                    self.dasiList = articleList
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
