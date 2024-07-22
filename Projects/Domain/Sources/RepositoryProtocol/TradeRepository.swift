//
//  TradeRepository.swift
//  Domain
//
//  Created by 유지호 on 7/21/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol TradeRepository {
    func fetchTrade(id: String) async throws -> Trade
    func fetchTradeList(_ category: TradeCategory) async throws -> [Trade]
    func writeTrade(_ trade: Trade) async throws
    func updateArticle(_ trade: Trade) async throws
    func deleteTrade(id: String) async throws
}
