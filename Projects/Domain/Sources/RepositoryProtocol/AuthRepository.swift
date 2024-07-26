//
//  AuthRepository.swift
//  Domain
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol AuthRepository {
    func requestLogin(email: String, password: String) async throws -> String
    func requestSignUp(email: String, password: String) async throws -> String
    func requestSignOut() async throws
    func requestWithdrawl() async throws
}
