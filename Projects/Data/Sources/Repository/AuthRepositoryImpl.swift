//
//  AuthRepositoryImpl.swift
//  Data
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import FirebaseAuth

public final class AuthRepositoryImpl: AuthRepository {
    
    private let authService = Auth.auth()
    
    
    public init() { }
    
    
    public func requestLogin(email: String, password: String) async throws -> String {
        let result = try await authService.signIn(withEmail: email, password: password)
        return result.user.uid
    }
    
    public func requestSignUp(email: String, password: String) async throws -> String {
        let result = try await authService.createUser(withEmail: email, password: password)
        return result.user.uid
    }
    
    public func requestSignOut() async throws {
        try authService.signOut()
    }
    
    public func requestWithdrawl() async throws {
        guard let user = authService.currentUser else { return }
        try await user.delete()
    }
    
}
