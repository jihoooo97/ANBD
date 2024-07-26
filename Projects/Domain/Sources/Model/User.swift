//
//  User.swift
//
//
//  Created by 유지호 on 4/3/24.
//

import ANBDCore

import Foundation

public struct User: Codable, Identifiable, Hashable {
    public let id: String
    public var email: String
    public var nickname: String
    public var favoriteLocation: Location
    public var profileImage: String
    public var fcmToken: String
    public var isAgreeMarketing: Bool
    public var likeArticles: [String]
    public var likeTrades: [String]
    public var accuaCount: Int
    public var nanuaCount: Int
    public var baccuaCount: Int
    public var dasiCount: Int
    
    
    public init(
        id: String,
        email: String,
        nickname: String,
        favoriteLocation: Location,
        profileImage: String = "https://firebasestorage.googleapis.com/v0/b/anbd-project3.appspot.com/o/Profile%2FDefaultUserProfileImage.png?alt=media&token=fc0e56d9-6855-4ead-ab28-d8ff789799b3",
        fcmToken: String,
        isAgreeMarketing: Bool,
        likeArticles: [String] = [],
        likeTrades: [String] = [],
        accuaCount: Int = 0,
        nanuaCount: Int = 0,
        baccuaCount: Int = 0,
        dasiCount: Int = 0
    ) {
        self.id = id
        self.email = email
        self.nickname = nickname
        self.favoriteLocation = favoriteLocation
        self.profileImage = profileImage
        self.fcmToken = fcmToken
        self.isAgreeMarketing = isAgreeMarketing
        self.likeArticles = likeArticles
        self.likeTrades = likeTrades
        self.accuaCount = accuaCount
        self.nanuaCount = nanuaCount
        self.baccuaCount = baccuaCount
        self.dasiCount = dasiCount
    }
}
