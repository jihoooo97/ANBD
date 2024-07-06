//
//  SignUpViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation
import Combine

public final class SignUpViewModel: BaseViewModel<LoginCoordinator> {
    
    @Published var email: String = ""
    @Published private(set) var emailDebounced: String = ""
    
    @Published var password: String = ""
    @Published private(set) var passwordDebounced: String = ""
    
    @Published var nickname: String = ""
    @Published private(set) var nicknameDebounced: String = ""
    
    @Published private(set) var validationState: AuthFieldState = .empty
    
    
    public override init(coordinator: LoginCoordinator) {
        super.init(coordinator: coordinator)
        
        $email
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] email in
                self?.emailDebounced = email
                self?.validate(.email, text: email)
            }
            .store(in: &cancellables)
        
        $password
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] password in
                self?.passwordDebounced = password
                self?.validate(.password, text: password)
            }
            .store(in: &cancellables)
        
        $nickname
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] nickname in
                self?.nicknameDebounced = nickname
                self?.validate(.nickname, text: nickname)
            }
            .store(in: &cancellables)
    }
    
    
    private func validate(_ type: FieldType, text: String) {
        let isValidateField =
        switch type {
        case .email:
            text.isValidateEmail()
        case .password:
            text.isValidatePassword()
        case .nickname:
            text.isValidateNickname()
        }
        
        if !text.isEmpty && !isValidateField {
            validationState = type.invalidState
        } else if text.isEmpty {
            validationState = .empty
        } else {
            validationState = .success
        }
    }
    
}

fileprivate enum FieldType {
    case email
    case password
    case nickname
    
    var invalidState: AuthFieldState {
        switch self {
        case .email:    .invalidEmail
        case .password: .invalidPassword
        case .nickname: .invalidNickname
        }
    }
}
