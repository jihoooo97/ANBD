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
    
    let injector: Injector
    
    func assemble(container: Container) {
        // MARK: Login
        container.register(LoginViewModel.self) { _ in
            let coordinator = LoginCoordinator(injector: injector)
            return LoginViewModel(coordinator: coordinator)
        }
        
        container.register(LoginView.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginView(viewModel: viewModel)
        }
        
        container.register(SignUpView.self) { _ in
            return SignUpView()
        }
        
        
        // MARK: Home
        container.register(HomeViewModel.self) { resolver in
            let coordinator = HomeCoordinator(injector: injector)
            return HomeViewModel(coordinator: coordinator)
        }
        
        container.register(HomeView.self) { resolver in
            let viewModel = resolver.resolve(HomeViewModel.self)!
            return HomeView(viewModel: viewModel)
        }
    }
    
}
