//
//  TradeView.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import CommonUI

import SwiftUI

public struct TradeView: View {
    @StateObject private var viewModel: TradeViewModel
        
    @State private var selectedCategory: TradeCategory = .nanua
        
    public init(viewModel: TradeViewModel, _ category: TradeCategory) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.selectedCategory = category
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            CategoryHeader(selection: $selectedCategory)
                .padding(.horizontal)
            
            TabView(selection: $selectedCategory) {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.nanuaList) { trade in
                            TradeListCell(trade: trade)
                                .contentShape(.rect)
                                .onTapGesture {
                                    viewModel.push(.tradeDetail(trade))
                                }
                        }
                    }
                    .padding()
                }
                .tag(TradeCategory.nanua)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.baccuaList) { trade in
                            TradeListCell(trade: trade)
                                .contentShape(.rect)
                                .onTapGesture {
                                    viewModel.push(.tradeDetail(trade))
                                }
                        }
                    }
                    .padding()
                }
                .tag(TradeCategory.baccua)
            }
            .frame(maxWidth: .infinity)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.smooth, value: selectedCategory)
        }
        .overlay(alignment: .bottomTrailing) {
            Button {
                viewModel.present(.tradeEdit(selectedCategory, nil))
            } label: {
                Image(systemName: "pencil")
                    .anbdFont(.subtitle1)
                    .foregroundStyle(.white)
                    .padding()
            }
            .background(Color.accentColor)
            .clipShape(.circle)
            .shadow(radius: 4)
            .padding()
        }
        .task {
            guard viewModel.nanuaList.isEmpty && viewModel.baccuaList.isEmpty else { return }
            await viewModel.fetchTradeList(category: .nanua)
            await viewModel.fetchTradeList(category: .baccua)
        }
    }
}
