//
//  TradeViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class TradeViewModel: BaseViewModel<TabCoordinator> {
    
    private let useCase: TradeUseCase
    
    @Published private(set) var nanuaList: [Trade] = []
    @Published private(set) var baccuaList: [Trade] = []
    
    
    public init(coordinator: TabCoordinator, useCase: TradeUseCase) {
        self.useCase = useCase
        super.init(coordinator: coordinator)
    }
    
    
    func fetchTradeList(category: TradeCategory) async {
        print("fetch \(category.name)")
        do  {
            let tradeList = try await useCase.fetchTradeList(category)
            
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
