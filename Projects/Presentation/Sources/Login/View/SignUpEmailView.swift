//
//  SignUpView.swift
//  Presentation
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct SignUpEmailView: View {
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
                title: "이메일",
                placeholder: "예) anbd@naver.com",
                text: $viewModel.email
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
            
            HStack {
                Text("이미 계정이 있으신가요?")
                
                Button("로그인") {
                    viewModel.pop()
                }
            }
            .padding(.top)
            .anbdFont(.body2)
            
            Spacer()
            
            RoundedButton(
                "다음",
                disabled: !viewModel.emailDebounced.isValidateEmail()
            ) {
                viewModel.push(.signUpPassword)
            }
            .frame(height: 56)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .toolbarRole(.editor)
    }
}
