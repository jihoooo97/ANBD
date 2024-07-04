//
//  TermsOfServiceButton.swift
//  CommonUI
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public struct TermsOfServiceButton: View {
    @Binding var didAgree: Bool
    
    private let title: String
    private let buttonAction: (() -> Void)?
    
    public init(
        _ title: String,
        _ didAgree: Binding<Bool>,
        buttonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self._didAgree = didAgree
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        HStack {
            Button {
                didAgree.toggle()
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(didAgree ? Color.accentColor : Color.g200)
                    
                    Text(title)
                        .anbdFont(.body1)
                }
            }
            
            Spacer()
            
            if let buttonAction {
                Button("보기") {
                    buttonAction()
                }
                .anbdFont(.body2)
                .foregroundStyle(Color.g400)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
