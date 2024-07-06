//
//  SignUpPasswordView.swift
//  Presentation
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct SignUpPasswordView: View {
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
                title: "비밀번호",
                placeholder: "8~16자 (숫자, 영문, 특수기호 중 2개 이상)",
                text: $viewModel.password
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
                disabled: !viewModel.passwordDebounced.isValidatePassword()
            ) {
                viewModel.push(.signUpNickname)
            }
            .frame(height: 56)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .toolbarRole(.editor)
    }
}
