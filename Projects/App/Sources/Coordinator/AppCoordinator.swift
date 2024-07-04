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
    
    var injector: Injector?
    
    @Published public var path: NavigationPath
    @Published public var sheet: AppScene?
    
    public init() {
        self.path = NavigationPath()
    }
    
    
    public func buildRootScene(_ isLogined: Bool) -> some View {
        return buildScene(isLogined ? .tab : .login)
    }
    
    @ViewBuilder
    public func buildScene(_ scene: AppScene) -> some View {
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
        case .tab:
            injector?.resolve(ANBDTabView.self)
        case .termsDetail(let type):
            injector?.resolve(TermsDetailView.self, argument: type)
        default:
            Text("잘못된 접근")
        }
    }
    
}
