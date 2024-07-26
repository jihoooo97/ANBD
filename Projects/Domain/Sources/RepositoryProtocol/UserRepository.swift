//
//  UserRepository.swift
//  Domain
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

public protocol UserRepository {
    func getUserInfo(id: String) async throws -> User
    func createUserInfo(user: User) async throws
    func editUserInfo(user: User) async throws
    func editUserPostCount(_ category: ANBDCategory, isIncrease: Bool) async throws
    func editUserFCMToken(fcmToken: String) async throws
    func deleteUserInfo(id: String) async throws
}
