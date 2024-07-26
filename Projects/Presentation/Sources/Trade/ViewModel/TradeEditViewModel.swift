//
//  TradeEditViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/21/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class TradeEditViewModel: BaseViewModel<TabCoordinator> {
    
    private let useCase: TradeUseCase
    private let storageService = StorageService.shared
    
    
    public init(coordinator: TabCoordinator, useCase: TradeUseCase) {
        self.useCase = useCase
        super.init(coordinator: coordinator)
    }
    
    
    func writeTrade(
        _ category: TradeCategory,
        title: String,
        content: String,
        itemCategory: ItemCategory,
        location: Location,
        myProduct: String,
        wantProduct: String,
        imageDatas: [Data]
    ) async {
        do {
            var trade = Trade(
                writerID: "jiho",
                writerNickname: "지호구",
                category: category,
                itemCategory: itemCategory.name,
                location: location.rawValue,
                title: title,
                content: content,
                myProduct: myProduct,
                wantProduct: wantProduct.isEmpty ? nil : wantProduct,
                thumbnailImageURL: ""
            )
            
            let thumbnailURL = try await storageService.uploadImage(path: .trade, id: trade.id, image: imageDatas[0], name: "thumbnail")
            let imageURLs = try await storageService.uploadImageList(path: .trade, id: trade.id, images: imageDatas)
            trade.thumbnailImageURL = thumbnailURL
            trade.imageURLs = imageURLs
            
            try await useCase.writeTrade(trade)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
