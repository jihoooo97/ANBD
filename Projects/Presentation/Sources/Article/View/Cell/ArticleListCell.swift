//
//  ArticleListCell.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import SwiftUI

struct ArticleListCell: View {
    private let storageService = StorageService()
    let article: Article
    
    @State private var imageURL: URL?
    @State private var isLiked: Bool = false
    
    var body: some View {
        HStack {
            AsyncImage(url: imageURL) { image in
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
        .task {
            guard imageURL == nil else { return }
            imageURL = await downloadImageURL(id: article.id, imageName: article.thumbnailImagePath)
        }
    }
    
    private func downloadImageURL(id: String, imageName: String) async -> URL {
        do {
            let url = try await storageService.downloadImage(path: .article, id: id, imageName: "thumbnail/" + imageName)
            return url
        } catch {
            return URL(string: "https://firebasestorage.googleapis.com/v0/b/anbd-project3.appspot.com/o/Profile%2FDefaultUserProfileImage.png?alt=media&token=fc0e56d9-6855-4ead-ab28-d8ff789799b3")!
        }
    }
}
