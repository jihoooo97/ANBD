//
//  HomeCoordinator.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct HomeCoordinator: Coordinator {
    private let injector: Injector
    public var type: AppScene = .home
    public var path: NavigationPath
    
    
    public init(injector: Injector) {
        self.injector = injector
        self.path = .init()
    }
    
    
    @ViewBuilder
    public func buildScene(_ scene: AppScene) -> some View {
        switch scene {
        case .home:
            injector.resolve(HomeView.self)
//        case .article:
//            <#code#>
//        case .articleDetail:
//            <#code#>
//        case .trade:
//            <#code#>
//        case .tradeDetail:
//            <#code#>
//        case .chatList:
//            <#code#>
//        case .chatRoom:
//            <#code#>
//        case .profile:
//            <#code#>
        default:
            Text("잘못된 접근")
        }
    }
    
}
