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
    public var nickname: String
    public var profileImage: String
    public var email: String
    public var favoriteLocation: Location
    public var fcmToken: String
    public var isOlderThanFourteen: Bool
    public var isAgreeService: Bool
    public var isAgreeCollectInfo: Bool
    public var isAgreeMarketing: Bool
    public var likeArticles: [String]
    public var likeTrades: [String]
    public var accuaCount: Int
    public var nanuaCount: Int
    public var baccuaCount: Int
    public var dasiCount: Int
    public var blockList: [String]
    
    
    public init(
        id: String,
        nickname: String,
        profileImage: String = "https://firebasestorage.googleapis.com/v0/b/anbd-project3.appspot.com/o/Profile%2FDefaultUserProfileImage.png?alt=media&token=fc0e56d9-6855-4ead-ab28-d8ff789799b3",
        email: String,
        favoriteLocation: Location,
        fcmToken: String,
        isOlderThanFourteen: Bool,
        isAgreeService: Bool,
        isAgreeCollectInfo: Bool,
        isAgreeMarketing: Bool, 
        likeArticles: [String] = [],
        likeTrades: [String] = [],
        accuaCount: Int = 0,
        nanuaCount: Int = 0,
        baccuaCount: Int = 0,
        dasiCount: Int = 0,
        blockList: [String] = []
    ) {
        self.id = id
        self.nickname = nickname
        self.profileImage = profileImage
        self.email = email
        self.favoriteLocation = favoriteLocation
        self.fcmToken = fcmToken
        self.isOlderThanFourteen = isOlderThanFourteen
        self.isAgreeService = isAgreeService
        self.isAgreeCollectInfo = isAgreeCollectInfo
        self.isAgreeMarketing = isAgreeMarketing
        self.likeArticles = likeArticles
        self.likeTrades = likeTrades
        self.accuaCount = accuaCount
        self.nanuaCount = nanuaCount
        self.baccuaCount = baccuaCount
        self.dasiCount = dasiCount
        self.blockList = blockList
    }
}
