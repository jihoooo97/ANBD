//
//  TradeDetailViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import Foundation


public final class TradeDetailViewModel: BaseViewModel<TabCoordinator> {
    
    private let storageService: StorageServiceInterface = StorageService()
    let trade: Trade
    
    @Published private(set) var imageURLs: [URL] = []
    
    
    public init(coordinator: TabCoordinator, trade: Trade) {
        self.trade = trade
        super.init(coordinator: coordinator)
    }
 
    
    func fetchImageList() async {
        guard !trade.imagePaths.isEmpty else { return }
        
        do {
            let urls = try await storageService.downloadImageList(path: .trade, id: trade.id)
            
            await MainActor.run {
                imageURLs = urls
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
