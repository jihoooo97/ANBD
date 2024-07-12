//
//  HomeDetailViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/12/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation


public final class HomeDetailViewModel: BaseViewModel<TabCoordinator> {
    
    private let storageService: StorageServiceInterface = StorageService()
    let category: ANBDCategory
    
    @Published private(set) var articleList: [Article] = []
    @Published private(set) var tradeList: [Trade] = []
    @Published private(set) var imageURLs: [URL] = []
    
    
    public init(coordinator: TabCoordinator, category: ANBDCategory) {
        self.category = category
        super.init(coordinator: coordinator)
    }
 
    
    func fetchPostList() async {
        do {
            switch category.key {
            case 0, 3:
                let documentSnapshots = try await FireStoreDB.article
                    .whereField("category", isEqualTo: category.key)
                    .order(by: "createdAt", descending: true)
                    .getDocuments()
                    .documents
                
                let articleList = try documentSnapshots.compactMap { try $0.data(as: Article.self) }
                
                await MainActor.run {
                    self.articleList = articleList
                }
            case 1, 2:
                let documentSnapshots = try await FireStoreDB.trade
                    .whereField("category", isEqualTo: category.key)
                    .order(by: "createdAt", descending: true)
                    .getDocuments()
                    .documents
                
                let tradeList = try documentSnapshots.compactMap { try $0.data(as: Trade.self) }
                
                await MainActor.run {
                    self.tradeList = tradeList
                }
            default: return
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchTradeList(category: TradeCategory) async {
        print("fetch \(category.name)")
        do  {
            let documentSnapshots = try await FireStoreDB.trade
                .whereField("category", isEqualTo: category.rawValue)
                .order(by: "createdAt", descending: true)
                .getDocuments()
                .documents
            
            let tradeList = try documentSnapshots.compactMap { try $0.data(as: Trade.self) }
            
            await MainActor.run {
                self.tradeList = tradeList
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
