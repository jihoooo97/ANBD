//
//  TradeUseCase.swift
//  Domain
//
//  Created by 유지호 on 7/21/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol TradeUseCase {
    func fetchTrade(id: String) async throws -> Trade
    func fetchTradeList(_ category: TradeCategory) async throws -> [Trade]
    func writeTrade(_ trade: Trade) async throws
}

public final class TradeUseCaseImpl: TradeUseCase {
    
    private let tradeRepository: TradeRepository
    
    
    public init(tradeRepository: TradeRepository) {
        self.tradeRepository = tradeRepository
    }
    
    
    public func fetchTrade(id: String) async throws -> Trade {
        try await tradeRepository.fetchTrade(id: id)
    }
    
    public func fetchTradeList(_ category: TradeCategory) async throws -> [Trade] {
        try await tradeRepository.fetchTradeList(category)
    }
    
    public func writeTrade(_ trade: Trade) async throws {
        try await tradeRepository.writeTrade(trade)
    }
    
}
