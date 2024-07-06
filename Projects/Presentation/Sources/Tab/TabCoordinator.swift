//
//  TabCoordinator.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public final class TabCoordinator: Coordinator {

    public typealias S = TabScene
    
    public var injector: Injector?
    
    @Published public var selection: ANBDTab = .home
    
    @Published public var path: NavigationPath = .init()
    @Published public var homePath: NavigationPath = .init()
    @Published public var articlePath: NavigationPath = .init()
    @Published public var tradePath: NavigationPath = .init()
    @Published public var chatPath: NavigationPath = .init()
    @Published public var profilePath: NavigationPath = .init()
    
    @Published public var sheet: TabScene?
    
    
    public init() { }
    
    
    public func push(_ scene: TabScene) {
        switch selection {
        case .home:
            homePath.append(scene)
        case .article:
            articlePath.append(scene)
        case .trade:
            tradePath.append(scene)
        case .chat:
            chatPath.append(scene)
        case .profile:
            profilePath.append(scene)
        }
    }
    
    @ViewBuilder
    public func buildScene(_ scene: TabScene) -> some View {
        switch scene {
        case .tab:
            injector?.resolve(ANBDTabView.self)
        case .home:
            injector?.resolve(HomeView.self)
        default:
            Text("TabScene")
//            case .article:
//                <#code#>
//            case .articleDetail:
//                <#code#>
//            case .trade:
//                <#code#>
//            case .tradeDetail:
//                <#code#>
//            case .chatList:
//                <#code#>
//            case .chatRoom:
//                <#code#>
//            case .profile:
//                <#code#>
        }
    }
    
}
