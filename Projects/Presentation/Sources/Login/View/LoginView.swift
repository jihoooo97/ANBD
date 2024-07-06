//
//  LoginView.swift
//  Presentation
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct LoginView: View {
    @ObservedObject private var viewModel: LoginViewModel
    @FocusState private var focus: Field?
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text("ANBD")
                    .anbdFont(.heading1)
                
                Text("환경 보호를 위한 여정을 함께해요")
                    .anbdFont(.body1)
            }
            .padding(.vertical, 80)
            
            TitleTextField(
                title: "이메일",
                placeholder: "예) anbd@naver.com",
                text: $viewModel.email
            )
            .padding(.bottom)
            .focused($focus, equals: .email)
            .keyboardType(.emailAddress)
            .submitLabel(.next)
            .onSubmit {
                focus = .password
            }
            
            TitleTextField(
                title: "비밀번호",
                placeholder: "8~16자 (숫자, 영문, 특수기호 중 2개 이상)",
                fieldType: .secured,
                text: $viewModel.password
            )
            .focused($focus, equals: .password)
            .keyboardType(.emailAddress)
            .submitLabel(.done)
            .onSubmit {
                focus = nil
            }
            
            Text(viewModel.validationState.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
                .anbdFont(.caption1)
                .foregroundStyle(.red)
            
            RoundedButton(
                "로그인",
                disabled: viewModel.validationState != .success
            ) {
                UserDefaults.standard.set(true, forKey: "isLogined")
            }
            .frame(height: 56)
            .padding(.vertical, 24)
            
            HStack {
                Text("계정이 없으신가요?")
                
                Button("회원가입") {
                    viewModel.push(.signUpEmail)
                }
            }
            .anbdFont(.body2)
            
            Spacer()
        }
        .padding(.horizontal)
        .background {
            Color.background
                .onTapGesture {
                    focus = nil
                }
        }
    }
    
    enum Field: Hashable {
        case email
        case password
    }
}
