//
//  UserRepositoryImpl.swift
//  Data
//
//  Created by 유지호 on 7/22/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import FirebaseFirestore

public final class UserRepositoryImpl: UserRepository {
    
    private let userDB = FireStoreDB.user
    
    
    public init() { }
    
    
    public func getUserInfo(id: String) async throws -> User {
        let user = try await userDB
            .document(id)
            .getDocument(as: User.self)
        return user
    }
    
    public func createUserInfo(user: User) async throws {
        try await userDB
            .document(user.id)
            .setData([
                "id": user.id,
                "email": user.email,
                "nickname": user.nickname,
                "favoriteLocation": user.favoriteLocation.rawValue,
                "profileImage": user.profileImage,
                "fcmToken": user.fcmToken,
                "isAgreeMarketing": user.isAgreeMarketing,
                "likeArticles": user.likeArticles,
                "likeTrades": user.likeTrades,
                "accuaCount": user.accuaCount,
                "nanuaCount": user.nanuaCount,
                "baccuaCount": user.baccuaCount,
                "dasiCount": user.dasiCount
            ])
    }
    
    public func editUserInfo(user: User) async throws {
        try await userDB
            .document(user.id)
            .updateData([
                "nickname": user.nickname,
                "favoriteLocation": user.favoriteLocation.rawValue,
                "isAgreeMarketing": user.isAgreeMarketing,
                "likeArticles": user.likeArticles,
                "likeTrades": user.likeTrades,
                "profileImage": user.profileImage,
                "accuaCount": user.accuaCount,
                "nanuaCount": user.nanuaCount,
                "baccuaCount": user.baccuaCount,
                "dasiCount": user.dasiCount
            ])
    }
    
    public func editUserPostCount(_ category: ANBDCategory, isIncrease: Bool) async throws {
        guard let userID = UserDefaultsManager.uid else { return }
        let field = category.name + "Count"
        
        try await userDB
            .document(userID)
            .updateData([field: FieldValue.increment(Int64(isIncrease ? 1 : -1))])
    }
    
    public func editUserFCMToken(fcmToken: String) async throws {
        guard let userID = UserDefaultsManager.uid else { return }
        
        try await userDB
            .document(userID)
            .updateData(["fcmToken": fcmToken])
    }
    
    public func deleteUserInfo(id: String) async throws {
        try await userDB.document(id).delete()
    }
    
}
