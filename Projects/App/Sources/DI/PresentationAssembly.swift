//
//  PresentationAssembly.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Presentation
import CommonUI
import Swinject

struct PresentationAssembly: Assembly {
    
    let loginCoordinator: LoginCoordinator
    let tabCoordinator: TabCoordinator
    
    func assemble(container: Container) {
        // MARK: Login
        container.register(LoginViewModel.self) { _ in
            return LoginViewModel(coordinator: loginCoordinator)
        }
        
        container.register(LoginView.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginView(viewModel: viewModel)
        }
        
        
        // MARK: SignUp
        container.register(SignUpViewModel.self) { _ in
            return SignUpViewModel(coordinator: loginCoordinator)
        }
        
        container.register(SignUpEmailView.self) { _ in
            return SignUpEmailView()
        }
        
        container.register(SignUpPasswordView.self) { _ in
            return SignUpPasswordView()
        }
        
        container.register(SignUpNicknameView.self) { _ in
            return SignUpNicknameView()
        }
        
        container.register(SignUpTermsView.self) { _ in
            return SignUpTermsView()
        }
        
        container.register(TermsDetailView.self) { (_, type: TermsType) in
            return TermsDetailView(type: type)
        }
        
        
        // MARK: TabView
        container.register(ANBDTabView.self) { resolver in
            let homeView = resolver.resolve(HomeView.self)!
            return ANBDTabView(
                coordinator: tabCoordinator,
                homeView: homeView
            )
        }
        
        
        // MARK: Home
        container.register(HomeViewModel.self) { resolver in
            return HomeViewModel(coordinator: tabCoordinator)
        }
        
        container.register(HomeView.self) { resolver in
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeView(viewModel: viewModel)
        }
    }
    
}
