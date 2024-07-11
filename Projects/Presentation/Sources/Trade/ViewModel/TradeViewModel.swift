//
//  TradeViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation
import FirebaseFirestore

public final class TradeViewModel: BaseViewModel<TabCoordinator> {
    
    @Published private(set) var nanuaList: [Trade] = []
    @Published private(set) var baccuaList: [Trade] = []
    
    private var nanuaQuery: Query?
    private var baccuaQuery: Query?
    
    
    public override init(coordinator: TabCoordinator) {
        super.init(coordinator: coordinator)
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
                switch category {
                case .nanua:
                    self.nanuaList = tradeList
                case .baccua:
                    self.baccuaList = tradeList
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}