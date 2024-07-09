//
//  ArticleViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public final class ArticleViewModel: BaseViewModel<TabCoordinator> {
    
    @Published var articleList: [String] = ["A", "B", "C", "D"]
    @Published var tradeList: [String] = ["1", "2", "3", "4"]
    
    public override init(coordinator: TabCoordinator) {
        super.init(coordinator: coordinator)
    }
    
}
