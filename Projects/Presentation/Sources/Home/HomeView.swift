//
//  HomeView.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import CommonUI

import SwiftUI

public struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                TabView {
                    ForEach(0..<4, id: \.self) { index in
                        Button {
                            print("\(index)")
                        } label: {
                            Text("\(index)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundStyle(.white)
                        }
                        .background(.green)
                    }
                }
                .frame(height: 100)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                VStack(spacing: 4) {
                    HStack {
                        Text("아껴쓰기")
                            .anbdFont(.subtitle1)
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.homeDetail(.article(.accua)))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                        .anbdFont(.body2)
                    }
                    
                    FullCell(article: viewModel.recentAccua)
                        .onTapGesture {
                            guard let article = viewModel.recentAccua else { return }
                            viewModel.push(.articleDetail(article))
                        }
                }
                
                VStack(spacing: 4) {
                    HStack {
                        Text("나눠쓰기")
                            .anbdFont(.subtitle1)
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.homeDetail(.trade(.nanua)))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                        .anbdFont(.body2)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.recentNanuaList) { nanua in
                                SqureCell(trade: nanua)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, -16)
                    .scrollIndicators(.hidden)
                }
                
                VStack(spacing: 4) {
                    HStack {
                        Text("바꿔쓰기")
                            .anbdFont(.subtitle1)
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.homeDetail(.trade(.baccua)))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                        .anbdFont(.body2)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.recentbaccuaList) { baccua in
                                SqureCell(trade: baccua)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, -16)
                    .scrollIndicators(.hidden)
                }
                
                VStack(spacing: 4) {
                    HStack {
                        Text("다시쓰기")
                            .anbdFont(.subtitle1)
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.homeDetail(.article(.dasi)))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                        .anbdFont(.body2)
                    }
                    
                    FullCell(article: viewModel.recentDasi)
                        .onTapGesture {
                            guard let article = viewModel.recentDasi else { return }
                            viewModel.push(.articleDetail(article))
                        }
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("ANBD")
                    .anbdFont(.heading2)
                    .foregroundStyle(Color.g900)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.push(.profile)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.g900)
                }
            }
        }
        .task {
            guard viewModel.recentAccua == nil,
                  viewModel.recentDasi == nil,
                  viewModel.recentNanuaList.isEmpty,
                  viewModel.recentbaccuaList.isEmpty
            else { return }
            
            await viewModel.fetchArticle(.accua)
            await viewModel.fetchArticle(.dasi)
            await viewModel.fetchTradeList(.nanua)
            await viewModel.fetchTradeList(.baccua)
        }
    }
}
