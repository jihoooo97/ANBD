//
//  CategoryHeader.swift
//  CommonUI
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import SwiftUI

public struct CategoryHeader<Category>: View where Category: Categorial & CaseIterable, Category.AllCases: RandomAccessCollection {
    @Binding var selection: Category
    
    public init(selection: Binding<Category>) {
        self._selection = selection
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            ForEach(Category.allCases) { category in
                VStack {
                    Button(category.name) {
                        selection = category
                    }
                    .frame(maxWidth: .infinity)
                    .anbdFont(.subtitle1)
                    .foregroundStyle(selection == category ? Color.g900 : .g400)
                    .disabled(selection == category)
                    
                    if selection == category {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 2)
                            .foregroundStyle(Color.accentColor)
                    }
                }
            }
        }
    }
}
