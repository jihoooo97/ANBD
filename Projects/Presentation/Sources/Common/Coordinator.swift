//
//  Coordinator.swift
//  CommonUI
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public enum CoordinatorType {
    case app
    case tab
}

public protocol Coordinator: ObservableObject {
    associatedtype S: Sceneable
    
    var path: NavigationPath { get set }
    var sheet: S? { get set }
    
    func push(_ scene: S)
    func pop()
    func popToRoot()
    func present(_ scene: S)
    func dismiss()
}


public extension Coordinator {
    
    func push(_ scene: S) {
        path.append(scene)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(_ scene: S) {
        sheet = scene
    }
    
    func dismiss() {
        sheet = nil
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
