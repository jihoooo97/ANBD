//
//  TradeEditView.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import SwiftUI

struct TradeEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditMode: Bool
    
    @State private var title: String = ""
    
    @State private var selection: TradeCategory
    @State private var myProduct: String = ""
    @State private var wantProduct: String = ""
    
    @State private var itemCategory: ItemCategory = .none
    @State private var location: Location = .seoul
    
    @State private var content: String = ""
    
    public init(
        isEditMode: Bool = false,
        _ selection: TradeCategory,
        trade: String? = nil
    ) {
        self.isEditMode = isEditMode
        self.selection = selection
        
        if let trade {
            self.title = trade
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
                .disabled(title.isEmpty || content.isEmpty)
            }
            .frame(height: 44)

            
            TextField("제목을 입력하세요", text: $title)
                .anbdFont(.heading3)
            
            Divider()
            
            TextEditor(text: $content)
                .anbdFont(.body1)
                .padding(.horizontal, -4)
                .opacity(content.isEmpty ? 0.8 : 1)
                .background(alignment: .leading) {
                    if content.isEmpty {
                        VStack {
                            Text("ANBD 이용자들을 위해 여러분들의 아껴쓰기/다시쓰기 Tip을 전수해주세요!")
                                .anbdFont(.body1)
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
