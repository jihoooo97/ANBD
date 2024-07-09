//
//  ArticleView.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import SwiftUI

public struct ArticleView: View {
    @ObservedObject private var viewModel: ArticleViewModel
    
    @State private var selectedCategory: ArticleCategory = .accua
    
    public init(viewModel: ArticleViewModel, _ category: ArticleCategory) {
        self.viewModel = viewModel
        self.selectedCategory = category
    }
    
    public var body: some View {
        VStack(spacing: 4) {
            HStack(alignment: .top) {
                ForEach(ArticleCategory.allCases) { category in
                    VStack {
                        Button(category.name) {
                            selectedCategory = category
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(selectedCategory == category ? Color.g900 : .g400)
                        .disabled(selectedCategory == category)
                        
                        if selectedCategory == category {
                            RoundedRectangle(cornerRadius: 2)
                                .frame(height: 2)
                                .foregroundStyle(Color.accentColor)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            TabView(selection: $selectedCategory) {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.articleList, id: \.self) { article in
                            ArticleListCell(article: article)
                                .contentShape(.rect)
                                .onTapGesture {
                                    viewModel.push(.articleDetail(id: article))
                                }
                        }
                    }
                    .padding()
                }
                .tag(ArticleCategory.accua)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tradeList, id: \.self) { trade in
                            Text(trade)
                        }
                    }
                    .padding()
                }
                .tag(ArticleCategory.dasi)
            }
            .frame(maxWidth: .infinity)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.smooth, value: selectedCategory)
        }
        .overlay(alignment: .bottomTrailing) {
            Button("글쓰기") {
                viewModel.present(.articleEdit(false, selectedCategory, nil))
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .padding()
        }
    }
}
