//
//  ArticleViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation
import FirebaseFirestore

public final class ArticleViewModel: BaseViewModel<TabCoordinator> {
    
    @Published private(set) var accuaList: [Article] = []
    @Published private(set) var dasiList: [Article] = []
    
    private var accuaQuery: Query?
    private var dasiQuery: Query?
    
    
    public override init(coordinator: TabCoordinator) {
        super.init(coordinator: coordinator)
    }
    
    
    func fetchArticleList(category: ArticleCategory) async {
        print("fetch \(category.name)")
        do  {
            let documentSnapshots = try await FireStoreDB.article
                .whereField("category", isEqualTo: category.rawValue)
                .order(by: "createdAt", descending: true)
                .getDocuments()
                .documents
            
            let articleList = documentSnapshots.compactMap { try? $0.data(as: Article.self) }
            
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
