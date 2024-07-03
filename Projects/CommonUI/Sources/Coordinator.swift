//
//  Coordinator.swift
//  CommonUI
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public enum AppScene: Hashable {
    case app, login, tab
    case signIn, signUp
    case home
    case article, articleDetail
    case trade, tradeDetail
    case chatList, chatRoom
    case profile
}

public protocol Coordinator {
    var path: NavigationPath { get set }
    var type: AppScene { get }
    
    mutating func push(_ scene: AppScene)
    mutating func pop()
    mutating func popToRoot()
}

public extension Coordinator {
    
    mutating func push(_ scene: AppScene) {
        path.append(scene)
    }
    
    mutating func pop() {
        path.removeLast()
    }
    
    mutating func popToRoot() {
        path.removeLast(path.count)
    }
    
}
