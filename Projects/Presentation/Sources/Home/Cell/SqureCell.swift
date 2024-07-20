//
//  SqureCell.swift
//  Presentation
//
//  Created by 유지호 on 7/12/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Domain

import SwiftUI

struct SqureCell: View {
    private let trade: Trade
    
    public init(trade: Trade) {
        self.trade = trade
    }
    
    var body: some View {
        AsyncImage(url: URL(string: trade.thumbnailImageURL)) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.g300
                .overlay {
                    ProgressView()
                }
        }
        .frame(width: 100, height: 100)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(alignment: .bottomLeading) {
            Text(trade.title)
                .anbdFont(.subtitle2)
                .foregroundStyle(.white)
                .lineLimit(1)
        }
    }
}
