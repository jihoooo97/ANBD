//
//  HomeViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation

public final class HomeViewModel: BaseViewModel<TabCoordinator> {
    
    private let storageService: StorageServiceInterface = StorageService()
    
    @Published private(set) var recentAccua: Article?
    @Published private(set) var recentDasi: Article?
    @Published private(set) var recentNanuaList: [Trade] = []
    @Published private(set) var recentbaccuaList: [Trade] = []
    
    
    public override init(coordinator: TabCoordinator) {
        super.init(coordinator: coordinator)
    }
    
    
    func fetchArticle(_ category: ArticleCategory) async {
        do {
            guard let documentSnapshot = try await FireStoreDB.article
                .whereField("category", isEqualTo: category.rawValue)
                .order(by: "createdAt", descending: true)
                .limit(to: 1)
                .getDocuments()
                .documents
                .first
            else { throw StorageError.downloadError }
            
            let article = try documentSnapshot.data(as: Article.self)
            
            await MainActor.run {
                switch category {
                case .accua:
                    recentAccua = article
                case .dasi:
                    recentDasi = article
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchTradeList(_ category: TradeCategory) async {
        do {
            let documentSnapshot = try await FireStoreDB.trade
                .whereField("category", isEqualTo: category.rawValue)
                .order(by: "createdAt", descending: true)
                .limit(to: 4)
                .getDocuments()
                .documents
            
            let tradeList = try documentSnapshot.compactMap { try $0.data(as: Trade.self) }
            
            await MainActor.run {
                switch category {
                case .nanua:
                    recentNanuaList = tradeList
                case .baccua:
                    recentbaccuaList = tradeList
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
