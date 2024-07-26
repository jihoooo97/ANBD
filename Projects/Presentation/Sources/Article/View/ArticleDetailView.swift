//
//  ArticleDetailView.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public struct ArticleDetailView: View {
    @StateObject private var viewModel: ArticleDetailViewModel
    
    @FocusState private var focused: Bool
    @State private var isLiked: Bool = false
    @State private var commentContent: String = ""
    
    public init(viewModel: ArticleDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text(viewModel.article.writerNickname)
                                .anbdFont(.subtitle3)
                                .foregroundStyle(Color.g900)
                                .onTapGesture {
                                    viewModel.push(.profile(id: viewModel.article.writerID))
                                }
                            
                            Text(viewModel.article.createdAt.relativeFormat)
                                .anbdFont(.caption2)
                                .foregroundStyle(Color.g400)
                        }
                        .frame(height: 44)
                        
                        Divider()
                            .padding(.top, -16)
                        
                        Text(viewModel.article.title)
                            .anbdFont(.heading3)
                        
                        Text(viewModel.article.content)
                            .anbdFont(.body1)
                            .padding(.bottom)
                        
                        VStack {
                            ForEach(viewModel.article.imageURLs, id: \.self) { url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .frame(height: 200)
                                } placeholder: {
                                    ProgressView()
                                        .frame(height: 200)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.g300)
                                }
                                .clipShape(.rect(cornerRadius: 8))
                            }
                        }
                        
                        HStack {
                            Button {
                                isLiked.toggle()
                            } label: {
                                Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(isLiked ? Color.accentColor : .g900)
                            }
                            
                            Text(viewModel.article.likeCount.formatted())
                                .anbdFont(.body2)
                                .foregroundStyle(Color.g900)
                        }
                        
                        Divider()
                        
                        Text("댓글 \(viewModel.commentList.count)")
                            .anbdFont(.subtitle3)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(viewModel.commentList) { comment in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text(comment.writerNickname)
                                            .anbdFont(.subtitle3)
                                            .foregroundStyle(Color.g900)
                                            .onTapGesture {
                                                viewModel.push(.profile(id: comment.writerID))
                                            }
                                        
                                        Text(comment.createdAt.relativeFormat)
                                            .anbdFont(.caption2)
                                            .foregroundStyle(Color.g400)
                                    }
                                    
                                    Text(comment.content)
                                        .anbdFont(.caption1)
                                        .foregroundStyle(Color.g900)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .onTapGesture {
                    focused = false
                }
                
                Divider()
                
                HStack {
                    TextField("댓글을 입력해주세요.", text: $commentContent, axis: .vertical)
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.g50)
                        .clipShape(.capsule)
                        .focused($focused)
                        .anbdFont(.caption2)
                    
                    Button {
                        Task {
                            await viewModel.writeComment(content: commentContent)
                            commentContent = ""
                            focused = false
                        }
                    } label: {
                        Image(systemName: "arrowshape.up.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(commentContent.isEmpty ? Color.g300 : .accentColor)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.background)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .anbdFont(.body2)
                        .foregroundStyle(Color.g900)
                }
                .disabled(commentContent.isEmpty)
            }
        }
        .task {
            await viewModel.fetchCommentList()
        }
    }
}
