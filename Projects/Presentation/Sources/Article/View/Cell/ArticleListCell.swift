//
//  ArticleListCell.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import SwiftUI

struct ArticleListCell: View {
    let article: Article
    
    @State private var isLiked: Bool = false
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.thumbnailImageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
                    .background(Color.g300)
            }
            .clipShape(.rect(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .anbdFont(.subtitle1)
                    .foregroundStyle(Color.g900)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 1) {
                    Text(article.writerNickname)
                    Text("・")
                    Text(article.createdAt.relativeFormat)
                }
                .anbdFont(.caption2)
                .foregroundStyle(Color.g400)
                .lineLimit(1)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 4) {
                    Spacer()
                    
                    if article.likeCount > 0 {
                        HStack(spacing: 2) {
                            Image(systemName: "heart")
                                .foregroundStyle(isLiked ? .red : .g900)
                            
                            Text(article.likeCount.formatted())
                        }
                    }
                    
                    if article.commentCount > 0 {
                        HStack(spacing: 2) {
                            Image(systemName: "text.bubble")
                            
                            Text(article.commentCount.formatted())
                        }
                    }
                }
                .anbdFont(.caption2)
            }
            .padding(.leading, 2)
        }
    }
}
