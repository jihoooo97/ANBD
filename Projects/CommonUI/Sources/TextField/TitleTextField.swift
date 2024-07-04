//
//  TitleTextField.swift
//  CommonUI
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public struct TitleTextField: View {
    let title: String
    let placeholder: String
    let fieldType: FieldType
    
    @Binding var text: String
    
    public init(
        title: String,
        placeholder: String,
        fieldType: FieldType = .normal,
        text: Binding<String>
    ) {
        self.title = title
        self.placeholder = placeholder
        self.fieldType = fieldType
        self._text = text
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .anbdFont(.subtitle3)
                .foregroundStyle(Color.g900)
            
            HStack {
                Group {
                    switch fieldType {
                    case .normal:
                        TextField(placeholder, text: $text)
                    case .secured:
                        SecureField(placeholder, text: $text)
                    }
                }
                .frame(height: 32)
                .textInputAutocapitalization(.never)
                .textContentType(.newPassword)
                .autocorrectionDisabled()
                
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundStyle(Color.g300)
                    }
                }
            }
            .padding(.horizontal, 4)
            .anbdFont(.body2)
            
            Divider()
                .foregroundStyle(Color.g200)
        }
    }
    
    public enum FieldType {
        case normal
        case secured
    }
}
