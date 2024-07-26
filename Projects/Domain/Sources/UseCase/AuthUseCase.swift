//
//  AuthUseCase.swift
//  Domain
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol AuthUseCase {
    func requestLogin(email: String, password: String) async throws
    func requestSignUp(email: String, password: String, nickname: String, location: Location, isAgreeMarketing: Bool) async throws
    func requestSignOut() async throws
    func requestWithdrawal() async throws
}

public final class AuthUseCaseImpl: AuthUseCase {
    
    private let authRepository: AuthRepository
    private let userRepository: UserRepository
    
    
    public init(authRepository: AuthRepository, userRepository: UserRepository) {
        self.authRepository = authRepository
        self.userRepository = userRepository
    }

    
    public func requestLogin(email: String, password: String) async throws {
        let uid = try await authRepository.requestLogin(email: email, password: password)
        UserDefaultsManager.uid = uid
        UserDefaultsManager.lastLoginDate = .now
    }
    
    public func requestSignUp(
        email: String,
        password: String,
        nickname: String,
        location: Location,
        isAgreeMarketing: Bool
    ) async throws {
        let uid = try await authRepository.requestSignUp(email: email, password: password)
        
        let newUser = User(
            id: uid,
            email: email,
            nickname: nickname,
            favoriteLocation: location,
            fcmToken: UserDefaultsManager.pushToken ?? "",
            isAgreeMarketing: isAgreeMarketing
        )
        
        try await userRepository.createUserInfo(user: newUser)
        UserDefaultsManager.uid = uid
        UserDefaultsManager.lastLoginDate = .now
    }
    
    public func requestSignOut() async throws {
        try await authRepository.requestSignOut()
        UserDefaultsManager.uid = nil
        UserDefaultsManager.lastLoginDate = nil
        UserDefaultsManager.pushToken = nil
    }
    
    public func requestWithdrawal() async throws {
        guard let userID = UserDefaultsManager.uid else { return }
        
        try await authRepository.requestWithdrawl()
        try await userRepository.deleteUserInfo(id: userID)
        UserDefaultsManager.uid = nil
        UserDefaultsManager.lastLoginDate = nil
        UserDefaultsManager.pushToken = nil
    }
    
}
