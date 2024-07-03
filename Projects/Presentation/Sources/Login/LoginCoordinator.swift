//
//  LoginCoordinator.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct LoginCoordinator: Coordinator {
    private let injector: Injector
    public var type: AppScene = .login
    
    public var path: NavigationPath
    
    
    public init(injector: Injector) {
        self.injector = injector
        self.path = .init()
    }
    
    
    @ViewBuilder
    public func buildScene(_ scene: AppScene) -> some View {
        switch scene {
        case .login:
            injector.resolve(LoginView.self)
        case .signUp:
            injector.resolve(SignUpView.self)
//        case .signIn:
//            <#code#>
//        case .signUp:
//            <#code#>
        default:
            Text("잘못된 접근")
        }
    }
}
