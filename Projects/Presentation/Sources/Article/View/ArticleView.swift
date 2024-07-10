//
//  ArticleView.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import CommonUI

import SwiftUI

public struct ArticleView: View {
    @StateObject private var viewModel: ArticleViewModel
    
    @State private var selectedCategory: ArticleCategory = .accua
    
    public init(viewModel: ArticleViewModel, _ category: ArticleCategory) {
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
                        ForEach(viewModel.accuaList) { article in
                            ArticleListCell(article: article)
                                .contentShape(.rect)
                                .onTapGesture {
                                    viewModel.push(.articleDetail(article))
                                }
                        }
                    }
                    .padding()
                }
                .tag(ArticleCategory.accua)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.dasiList) { article in
                            ArticleListCell(article: article)
                                .contentShape(.rect)
                                .onTapGesture {
                                    viewModel.push(.articleDetail(article))
                                }
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
            Button {
                viewModel.present(.articleEdit(false, selectedCategory, nil))
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
            guard viewModel.accuaList.isEmpty && viewModel.dasiList.isEmpty else { return }
            await viewModel.fetchArticleList(category: .accua)
            await viewModel.fetchArticleList(category: .dasi)
        }
    }
}
