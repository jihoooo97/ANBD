//
//  UserUseCase.swift
//  Domain
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol UserUseCase {
    func getUserInfo(id: String) async throws -> User
}

public final class UserUseCaseImpl: UserUseCase {
    
    private let userRepository: UserRepository
    
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    
    public func getUserInfo(id: String) async throws -> User {
        let userInfo = try await userRepository.getUserInfo(id: id)
        return userInfo
    }
    
}
