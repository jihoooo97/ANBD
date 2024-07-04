//
//  SignUpNicknameView.swift
//  Presentation
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct SignUpNicknameView: View {
    @EnvironmentObject private var viewModel: SignUpViewModel
    
    @FocusState private var focused: Bool
    
    public init() { }
    
    public var body: some View {
        VStack {
            Text("회원가입")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 48)
                .anbdFont(.heading2)
            
            TitleTextField(
                title: "닉네임",
                placeholder: "2~20자의 닉네임을 입력해주세요",
                text: $viewModel.nickname
            )
            .keyboardType(.emailAddress)
            .submitLabel(.done)
            .focused($focused)
            .onAppear {
                focused = true
            }
            
            Text(viewModel.validationState.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .anbdFont(.caption1)
                .foregroundStyle(.red)
            
            Spacer()
            
            RoundedButton(
                "다음",
                disabled: !viewModel.nicknameDebounced.isValidateNickname()
            ) {
                viewModel.push(.signUpTerms)
            }
            .frame(height: 56)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .toolbarRole(.editor)
    }
}

#Preview {
    SignUpNicknameView()
}
