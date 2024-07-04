//
//  PresentationAssembly.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Presentation
import Foundation
import Swinject

struct PresentationAssembly: Assembly {
    
    let coordinator: Coordinator
    
    func assemble(container: Container) {
        // MARK: Login
        container.register(LoginViewModel.self) { _ in
            return LoginViewModel(coordinator: coordinator)
        }
        
        container.register(LoginView.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginView(viewModel: viewModel)
        }
        
        
        // MARK: SignUp
        container.register(SignUpViewModel.self) { _ in
            return SignUpViewModel(coordinator: coordinator)
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
            return ANBDTabView(homeView: homeView)
        }
        
        
        // MARK: Home
        container.register(HomeViewModel.self) { resolver in
            return HomeViewModel()
        }
        
        container.register(HomeView.self) { resolver in
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeView(viewModel: viewModel)
        }
    }
    
}
