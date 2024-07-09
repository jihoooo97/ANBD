//
//  ArticleListCell.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

struct ArticleListCell: View {
    let article: String
    
    @State private var isLiked: Bool = false
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.accentColor)
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text(article)
                
                HStack {
                    Text("서울")
                    Text("1시간 전")
                }
                
                Spacer()
            }
            
            Spacer()
            
            VStack {
                Spacer()
                
                Image(systemName: "heart")
                    .anbdFont(.subtitle2)
                    .foregroundStyle(isLiked ? .red : .g900)
            }
        }
    }
}
