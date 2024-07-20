//
//  FullCell.swift
//  Presentation
//
//  Created by 유지호 on 7/12/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Domain

import SwiftUI

struct FullCell: View {
    private let article: Article
    
    public init(article: Article?) {
        self.article = article ?? .default
    }
    
    var body: some View {
        AsyncImage(url: URL(string: article.thumbnailImageURL)) { image in
            image
                .resizable()
                .overlay(alignment: .bottomLeading) {
                    Text(article.title)
                        .anbdFont(.subtitle2)
                        .foregroundStyle(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
        } placeholder: {
            Color.g300
                .overlay {
                    ProgressView()
                }
        }
        .frame(height: 100)
        .clipShape(.rect(cornerRadius: 12))
    }
}
