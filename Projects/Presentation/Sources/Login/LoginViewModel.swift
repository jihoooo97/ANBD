//
//  LoginViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public final class LoginViewModel: ObservableObject {
    
    @Published public var coordinator: LoginCoordinator
    
    public init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
    public func moveToSignUpView() {
        coordinator.push(.signUp)
    }
    
}
