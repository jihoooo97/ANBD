//
//  TradeRepositoryImpl.swift
//  Data
//
//  Created by 유지호 on 7/21/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class TradeRepositoryImpl: TradeRepository {
    
    private let tradeDB = FireStoreDB.trade
    
    
    public init() { }
    
    
    public func fetchTrade(id: String) async throws -> Trade {
        let trade = try await tradeDB
            .document(id)
            .getDocument()
            .data(as: Trade.self)
        return trade
    }
    
    public func fetchTradeList(_ category: TradeCategory) async throws -> [Trade] {
        let documentSnapshots = try await tradeDB
            .whereField("category", isEqualTo: category.rawValue)
            .order(by: "createdAt", descending: true)
            .getDocuments()
            .documents
        
        let tradeList = documentSnapshots.compactMap { try? $0.data(as: Trade.self) }
        return tradeList
    }
    
    public func writeTrade(_ trade: Trade) async throws {
        try tradeDB.document("\(trade.id)").setData(from: trade)
        
    }
    
    public func updateArticle(_ trade: Trade) async throws {
        try tradeDB.document(trade.id).setData(from: trade)
    }
    
    public func deleteTrade(id: String) async throws {
        try await tradeDB.document(id).delete()
    }
    
}
