//
//  AppCoordinator.swift
//  ANBD
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Presentation
import CommonUI
import SwiftUI

public final class AppCoordinator: ObservableObject, Coordinator {

    private let injector: Injector
    public var type: AppScene = .app
    
    @Published public var path: NavigationPath
    
    
    public init(injector: Injector) {
        self.injector = injector
        self.path = NavigationPath()
    }

    
    func showLoginFlow() -> some View {
        return injector.resolve(LoginView.self)
    }
    
    func showTabFlow() -> some View {
        let tabCoordinator = TabCoordinator(injector: injector)
        return tabCoordinator.buildScene()
    }
    
    public func buildRootScene(_ isLogined: Bool) -> some View {
        return buildScene(isLogined ? .tab : .login)
    }
    
    @ViewBuilder
    public func buildScene(_ scene: AppScene) -> some View {
        switch scene {
        case .tab:
            showTabFlow()
        case .login:
            showLoginFlow()
        default:
            Text("잘못된 접근")
        }
    }
    
}
