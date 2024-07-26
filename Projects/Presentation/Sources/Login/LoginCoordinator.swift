//
//  LoginCoordinator.swift
//  Presentation
//
//  Created by 유지호 on 7/6/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public final class LoginCoordinator: Coordinator {

    public typealias S = AuthScene
    
    public var injector: Injector? = DependencyInjector.shared
    
    @Published public var path: NavigationPath = .init()
    @Published public var sheet: AuthScene?
    
    public static let shared = LoginCoordinator()
    
    
    public init() { }
    
    
    public func buildRootScene(_ scene: AuthScene) -> some View {
        return buildScene(scene)
    }
    
    @ViewBuilder
    public func buildScene(_ scene: AuthScene) -> some View {
        switch scene {
        case .login:
            injector?.resolve(LoginView.self)
        case .signUpEmail:
            injector?.resolve(SignUpEmailView.self)
        case .signUpPassword:
            injector?.resolve(SignUpPasswordView.self)
        case .signUpNickname:
            injector?.resolve(SignUpNicknameView.self)
        case .signUpTerms:
            injector?.resolve(SignUpTermsView.self)
        case .termsDetail(let type):
            injector?.resolve(TermsDetailView.self, arg: type)
        }
    }
    
}
