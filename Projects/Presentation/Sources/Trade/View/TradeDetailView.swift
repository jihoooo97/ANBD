//
//  TradeDetailView.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import CommonUI

import SwiftUI

public struct TradeDetailView: View {
    
    @StateObject private var viewModel: TradeDetailViewModel
    
    @State private var imageSelection: Int = 0
    @State private var isLiked: Bool = false
    
    
    public init(viewModel: TradeDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    public var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    TabView(selection: $imageSelection) {
                        ForEach(viewModel.trade.imageURLs.indices, id: \.self) { index in
                            let url = URL(string: viewModel.trade.imageURLs[index])
                            
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 300)
                                    .background(Color.g300)
                            }
                            .tag(index)
                        }
                    }
                    .frame(height: 300)
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.trade.writerNickname)
                            .anbdFont(.subtitle1)
                            .foregroundStyle(Color.g900)
                        
                        Text(viewModel.trade.createdAt.relativeFormat)
                            .anbdFont(.body2)
                            .foregroundStyle(Color.g600)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(viewModel.trade.title)
                            .anbdFont(.heading3)
                            .padding(.bottom, 2)
                        
                        Text(viewModel.trade.itemCategory + " · " + viewModel.trade.location)
                            .anbdFont(.caption2)
                            .foregroundStyle(Color.g500)
                            .padding(.bottom, 12)
                        
                        Text(viewModel.trade.content)
                            .anbdFont(.body1)
                            .foregroundStyle(Color.g900)
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
            
            HStack {
                Button {
                    isLiked.toggle()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(isLiked ? Color.heartRed : .g300)
                }
                
                if let wantProduct = viewModel.trade.wantProduct {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("줄 것")
                            
                            Text("받을 것")
                        }
                        .anbdFont(.subtitle3)
                        .foregroundStyle(Color.g400)
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.trade.myProduct)
                            
                            Text(wantProduct)
                        }
                        .anbdFont(.subtitle2)
                        .foregroundStyle(Color.g900)
                    }
                } else {
                    Text(viewModel.trade.myProduct)
                }
                
                Spacer()
                
                Button("채팅하기") {
                    
                }
                .buttonStyle(BorderedProminentButtonStyle())
            }
            .padding(.horizontal)
        }
        .navigationTitle("나눔·거래")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .anbdFont(.body2)
                        .foregroundStyle(Color.g900)
                }
            }
        }
        .task {
            await viewModel.fetchImageList()
        }
    }
}
