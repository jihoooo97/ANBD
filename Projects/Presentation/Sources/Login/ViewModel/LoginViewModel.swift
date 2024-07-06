//
//  LoginViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Foundation
import Combine

public final class LoginViewModel: BaseViewModel<LoginCoordinator> {
    
    @Published var email: String = ""
    @Published private(set) var emailDebounced: String = ""
    
    @Published var password: String = ""
    @Published private(set) var passwordDebounced: String = ""
    
    @Published private(set) var validationState: AuthFieldState = .empty
    
    
    public override init(coordinator: LoginCoordinator) {
        super.init(coordinator: coordinator)
        
        $email
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] email in
                self?.emailDebounced = email
            }
            .store(in: &cancellables)
        
        $password
            .removeDuplicates()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] password in
                self?.passwordDebounced = password
            }
            .store(in: &cancellables)
            
        $emailDebounced
            .combineLatest($passwordDebounced)
            .sink { [weak self] email, password in
                self?.validate(email: email, password: password)
            }
            .store(in: &cancellables)
    }
    
    
    private func validate(email: String, password: String) {
        if (!email.isEmpty && !email.isValidateEmail()) && (!password.isEmpty && !password.isValidatePassword()) {
            validationState = .invalidBoth
        } else if !email.isEmpty && !email.isValidateEmail() {
            validationState = .invalidEmail
        } else if !password.isEmpty && !password.isValidatePassword() {
            validationState = .invalidPassword
        } else if email.isEmpty || password.isEmpty {
            validationState = .empty
        } else {
            validationState = .success
        }
    }
    
}
