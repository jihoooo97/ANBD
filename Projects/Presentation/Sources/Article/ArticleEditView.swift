//
//  ArticleEditView.swift
//  Presentation
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import SwiftUI

public struct ArticleEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditMode: Bool
    @State private var selection: ArticleCategory
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    public init(
        isEditMode: Bool = false,
        _ selection: ArticleCategory,
        article: String? = nil
    ) {
        self.isEditMode = isEditMode
        self.selection = selection
        
        if let article {
            self.title = article
            self.content = "수정 중 입니다"
        }
    }
    
    public var body: some View {
        VStack {
            HStack {
                Button("취소") {
                    dismiss()
                }
                
                Spacer()
                
                Text(selection.name)
                
                Spacer()
                
                Button("완료") {
                    
                }
            }
            .frame(height: 44)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.accentColor)
                .frame(height: 50)
                .overlay {
                    HStack {
                        Text("안내")
                            .anbdFont(.subtitle2)
                        
                        Text("명예훼손, 광고/홍보 목적의 글은 올리실 수 없어요.")
                            .anbdFont(.body2)
                    }
                    .foregroundStyle(.white)
                }
            
            TextField("제목을 입력하세요", text: $title)
            
            Divider()
            
            TextEditor(text: $content)
                .padding(.horizontal, -4)
                .opacity(content.isEmpty ? 0.8 : 1)
                .background(alignment: .leading) {
                    if content.isEmpty {
                        VStack {
                            Text("내용을 입력하세요")
                                .padding(.horizontal, 1)
                                .padding(.top, 8)
                            
                            Spacer()
                        }
                    }
                }
        
        }
        .padding(.horizontal)
    }
}
