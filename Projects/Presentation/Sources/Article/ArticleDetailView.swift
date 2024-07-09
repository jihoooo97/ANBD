//
//  ArticleDetailView.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public struct ArticleDetailView: View {
    private let articleID: String
    
    @FocusState private var focused: Bool
    @State private var isLiked: Bool = false
    @State private var commentContent: String = ""
    
    public init(articleID: String) {
        self.articleID = articleID
    }
    
    public var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        Text(articleID)
                        
                        Text("게시글 내용입니다 게시글 내용입니다\n게시글 내용 두번째 줄")
                        
                        VStack {
                            ForEach(0..<4, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.g300)
                                    .frame(height: 200)
                                    .overlay {
                                        Text("\(index)")
                                    }
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
                            
                            Text("999")
                                .foregroundStyle(Color.g900)
                        }
                        .anbdFont(.body2)
                        
                        Divider()
                    }
                    .padding()
                }
                .onTapGesture {
                    focused = false
                }
                
                HStack {
                    TextField("", text: $commentContent, axis: .vertical)
                        .frame(height: 44)
                        .focused($focused)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.up.circle")
                            .anbdFont(.heading3)
                            .foregroundStyle(commentContent.isEmpty ? Color.g300 : .accentColor)
                    }
                }
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
            }
        }
    }
}
