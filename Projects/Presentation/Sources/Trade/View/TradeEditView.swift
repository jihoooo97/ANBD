//
//  TradeEditView.swift
//  Presentation
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import SwiftUI
import PhotosUI

public struct TradeEditView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: TradeEditViewModel
    
    @FocusState private var focused: Field?
    
    @State private var selectedImages: [PhotosPickerItem] = []
    @State private var selectedImageDatas: [Data] = []
    
    @State private var title: String = ""
    @State private var selection: TradeCategory
    @State private var myProduct: String = ""
    @State private var wantProduct: String = ""
    
    @State private var itemCategory: ItemCategory = .none
    @State private var location: Location = .seoul
    
    @State private var content: String = ""
    
    public init(
        viewModel: TradeEditViewModel,
        _ selection: TradeCategory,
        trade: Trade? = nil
    ) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.selection = selection
        
        if let trade {
            self.title = trade.title
            self.selection = trade.category
            self.myProduct = trade.myProduct
            self.wantProduct = trade.wantProduct ?? ""
            self.itemCategory = ItemCategory.allCases.first { $0.name == trade.itemCategory } ?? .none
            self.location = Location.allCases.first{ $0.name == trade.location } ?? .seoul
            self.content = trade.content
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
                    Task {
                        await viewModel.writeTrade(
                            selection,
                            title: title,
                            content: content,
                            itemCategory: itemCategory,
                            location: location,
                            myProduct: myProduct,
                            wantProduct: wantProduct,
                            imageDatas: selectedImageDatas
                        )
                        
                        dismiss()
                    }
                }
                .disabled(title.isEmpty || content.isEmpty)
            }
            .frame(height: 44)
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    PhotosPicker(
                        selection: $selectedImages,
                        maxSelectionCount: 5 - selectedImages.count
                    ) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .strokeBorder(.gray, lineWidth: 1)
                            .overlay {
                                VStack {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 25))
                                        .foregroundStyle(.gray)
                                        .padding(3)
                                    Text("\(selectedImages.count) / 5")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 15))
                                }
                            }
                    }
                    .frame(width: 80, height: 80)
                    
                    VStack(alignment: .leading) {
                        Text("제목")
                            .anbdFont(.subtitle2)
                        
                        TextField("제목", text: $title)
                            .focused($focused, equals: .title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                   
                    VStack(alignment: .leading) {
                        Text("거래 방식")
                            .anbdFont(.subtitle2)
                        
                        HStack {
                            ForEach(TradeCategory.allCases) { category in
                                Button(category.name) {
                                    guard selection != category else { return }
                                    selection = category
                                    wantProduct = ""
                                }
                                .buttonStyle(BorderedProminentButtonStyle())
                                .tint(selection == category ? Color.accentColor : .g300)
                                .disabled(selection == category)
                            }
                        }
                        
                        switch selection {
                        case .nanua:
                            TextField("나눌 물건", text: $myProduct)
                                .focused($focused, equals: .myProduct)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        case .baccua:
                            HStack {
                                TextField("바꿀 물건", text: $myProduct)
                                    .focused($focused, equals: .myProduct)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                Image(systemName: "arrow.left.and.right")
                                
                                TextField("원하는 물건", text: $wantProduct)
                                    .focused($focused, equals: .wantProduct)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("카테고리")
                            .anbdFont(.subtitle2)
                        
                        Text(itemCategory.name)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("지역")
                            .anbdFont(.subtitle2)
                        
                        Text(location.name)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("상세설명")
                            .anbdFont(.subtitle2)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(.gray)
                            .overlay {
                                TextEditor(text: $content)
                                    .anbdFont(.body1)
                                    .focused($focused, equals: .content)
                                    .opacity(content.isEmpty ? 0.8 : 1)
                                    .background(alignment: .leading) {
                                        if content.isEmpty {
                                            VStack {
                                                Text("ANBD 이용자들을 위해 여러분들의 아껴쓰기/다시쓰기 Tip을 전수해주세요!")
                                                    .anbdFont(.body1)
                                                    .padding(8)
                                                
                                                Spacer()
                                            }
                                        }
                                    }
                                    .padding(8)
                            }
                            .frame(minHeight: 200)
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .onChange(of: selectedImages) { items in
            for item in items {
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        guard let data else { return }
                        selectedImageDatas.append(data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .onTapGesture {
            focused = nil
        }
    }
    
    private enum Field: Hashable {
        case title
        case myProduct
        case wantProduct
        case content
    }
}
