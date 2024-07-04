//
//  Coordinator.swift
//  CommonUI
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public enum AppScene: Identifiable, Hashable {
    case login, tab
    case signUpEmail, signUpPassword, signUpNickname, signUpTerms
    case home
    case article, articleDetail
    case trade, tradeDetail
    case chatList, chatRoom
    case profile
    case termsDetail(TermsType)
    
    public var id: String { "\(self)" }
}

public protocol Coordinator: AnyObject {
    var path: NavigationPath { get set }
    var sheet: AppScene? { get set }
    
    func push(_ scene: AppScene)
    func pop()
    func popToRoot()
}

public extension Coordinator {
    
    func push(_ scene: AppScene) {
        path.append(scene)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(sheet: AppScene) {
        self.sheet = sheet
    }
    
    func dismiss() {
        self.sheet = nil
    }
    
}


public enum TermsType {
    case olderThanFourTeen
    case agreeToService
    case agreeToCollectInfo
    case agreeToMarketing
    
    public var url: String {
        switch self {
        case .olderThanFourTeen:
            return ""
        case .agreeToService:
            return "https://oval-second-abc.notion.site/ANBD-0cde8fed32014e19830309431bfcdebb"
        case .agreeToCollectInfo:
            return "https://oval-second-abc.notion.site/ANBD-4b59058a70ba46ef9753fe40502f94e3"
        case .agreeToMarketing:
            return "https://oval-second-abc.notion.site/ANBD-f265775da8fe4fe3957048f4c2028f5a"
        }
    }
}
