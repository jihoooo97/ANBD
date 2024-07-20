//
//  TradeListCell.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Domain

import SwiftUI

struct TradeListCell: View {
    let trade: Trade
    
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
                Text(trade.title)
                    .anbdFont(.subtitle1)
                    .foregroundStyle(Color.g900)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 1) {
                    Text(trade.writerNickname)
                    Text("・")
                    Text(trade.createdAt.relativeFormat)
                }
                .anbdFont(.caption2)
                .foregroundStyle(Color.g400)
                .lineLimit(1)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 4) {
                    Spacer()
                    
                    Image(systemName: "heart")
                        .foregroundStyle(isLiked ? .red : .g900)
                }
                .anbdFont(.caption2)
            }
            .padding(.leading, 2)
        }
        .task {
            guard imageURL == nil,
                  let url = URL(string: trade.thumbnailImageURL)
            else { return }
            imageURL = url
        }
    }
}
