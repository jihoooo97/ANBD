//
//  HomeDetailView.swift
//  Presentation
//
//  Created by 유지호 on 7/12/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import SwiftUI

public struct HomeDetailView: View {
    @StateObject private var viewModel: HomeDetailViewModel
    
    public init(viewModel: HomeDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack {
                content
            }
            .padding()
        }
        .scrollIndicators(.visible)
        .task {
            await viewModel.fetchPostList()
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.category {
        case .article:
            ForEach(viewModel.articleList) { article in
                ArticleListCell(article: article)
                    .contentShape(.rect)
                    .onTapGesture {
                        viewModel.push(.articleDetail(article))
                    }
            }
        case .trade:
            ForEach(viewModel.tradeList) { trade in
                TradeListCell(trade: trade)
                    .contentShape(.rect)
                    .onTapGesture {
                        viewModel.push(.tradeDetail(trade))
                    }
            }
        }
    }
}
