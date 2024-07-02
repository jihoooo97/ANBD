//
//  Coordinator.swift
//  CommonUI
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public enum AppFlow: Hashable {
    case login
    case tab
}

public enum AppScene: Hashable {
    case login, tab
    case signUp
    case home
    case article, articleDetail
    case trade, tradeDetail
    case chatList, chatRoom
    case profile
}

public protocol Coordinator {
    var path: NavigationPath { get }
    
    func push(_ scene: AppScene)
    func pop()
    func popToRoot()
}
