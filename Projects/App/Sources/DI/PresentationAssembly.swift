//
//  PresentationAssembly.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain
import Presentation

import SwiftUI
import Swinject

struct PresentationAssembly: Assembly {
    
    let loginCoordinator: LoginCoordinator = .shared
    let tabCoordinator: TabCoordinator = .shared
    
    func assemble(container: Container) {
        // MARK: Login
        container.register(LoginViewModel.self) { resolver in
            let useCase = resolver.resolve(AuthUseCase.self)!
            return LoginViewModel(coordinator: loginCoordinator, useCase: useCase)
        }
        
        container.register(LoginView.self) { resolver in
            let viewModel = resolver.resolve(LoginViewModel.self)!
            return LoginView(viewModel: viewModel)
        }
        
        
        // MARK: SignUp
        container.register(SignUpViewModel.self) { resolver in
            let useCase = resolver.resolve(AuthUseCase.self)!
            return SignUpViewModel(coordinator: loginCoordinator, useCase: useCase)
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
        
        
        // MARK: Profile
        container.register(ProfileViewModel.self) { (resolver, id: String) in
            let authUseCase = resolver.resolve(AuthUseCase.self)!
            let userUseCase = resolver.resolve(UserUseCase.self)!
            return ProfileViewModel(
                coordinator: tabCoordinator,
                authUseCase: authUseCase,
                userUseCase: userUseCase,
                id: id
            )
        }
        
        container.register(ProfileView.self) { (resolver, id: String) in
            let viewModel = resolver.resolve(ProfileViewModel.self, argument: id)!
            return ProfileView(viewModel: viewModel)
        }
        
        
        // MARK: TabView
        container.register(ANBDTabView.self) { resolver in
            let homeView = resolver.resolve(HomeView.self)!
            let articleView = resolver.resolve(ArticleView.self, argument: ArticleCategory.accua)!
            let tradeView = resolver.resolve(TradeView.self, argument: TradeCategory.nanua)!
            let profileView = resolver.resolve(ProfileView.self, argument: UserDefaultsManager.uid ?? "")!
            
            return ANBDTabView(
                coordinator: tabCoordinator,
                homeView: homeView,
                articleView: articleView,
                tradeView: tradeView,
                profileView: profileView
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
        
        container.register(HomeDetailViewModel.self) { (resolver, category: ANBDCategory) in
            return HomeDetailViewModel(coordinator: tabCoordinator, category: category)
        }
        
        container.register(HomeDetailView.self) { (resolver, category: ANBDCategory) in
            let viewModel = resolver.resolve(HomeDetailViewModel.self, argument: category)!
            return HomeDetailView(viewModel: viewModel)
        }
        
        
        // MARK: Article
        container.register(ArticleViewModel.self) { resolver in
            let useCase = resolver.resolve(ArticleUseCase.self)!
            return ArticleViewModel(coordinator: tabCoordinator, useCase: useCase)
        }
        
        container.register(ArticleView.self) { (resolver, category: ArticleCategory) in
            let viewModel = resolver.resolve(ArticleViewModel.self)!
            return ArticleView(viewModel: viewModel, category)
        }
        
        container.register(ArticleDetailViewModel.self) { (resolver, article: Article) in
            let commentUseCase = resolver.resolve(CommentUseCase.self)!
            return ArticleDetailViewModel(coordinator: tabCoordinator, commentUseCase: commentUseCase, article: article)
        }
        
        container.register(ArticleDetailView.self) { (resolver, article: Article) in
            let viewModel = resolver.resolve(ArticleDetailViewModel.self, argument: article)!
            return ArticleDetailView(viewModel: viewModel)
        }
        
        container.register(ArticleEditViewModel.self) { resolver in
            let useCase = resolver.resolve(ArticleUseCase.self)!
            return ArticleEditViewModel(coordinator: tabCoordinator, useCase: useCase)
        }
        
        container.register(ArticleEditView.self) { (resolver, category: ArticleCategory, article: Article?) in
            let viewModel = resolver.resolve(ArticleEditViewModel.self)!
            return ArticleEditView(viewModel: viewModel, category, article: article)
        }
        
        
        // MARK: Trade
        container.register(TradeViewModel.self) { resolver in
            let useCase = resolver.resolve(TradeUseCase.self)!
            return TradeViewModel(coordinator: tabCoordinator, useCase: useCase)
        }
        
        container.register(TradeView.self) { (resolver, category: TradeCategory) in
            let viewModel = resolver.resolve(TradeViewModel.self)!
            return TradeView(viewModel: viewModel, category)
        }
        
        container.register(TradeDetailViewModel.self) { (resolver, trade: Trade) in
            return TradeDetailViewModel(coordinator: tabCoordinator, trade: trade)
        }
        
        container.register(TradeDetailView.self) { (resolver, trade: Trade) in
            let viewModel = resolver.resolve(TradeDetailViewModel.self, argument: trade)!
            return TradeDetailView(viewModel: viewModel)
        }
        
        container.register(TradeEditViewModel.self) { resolver in
            let useCase = resolver.resolve(TradeUseCase.self)!
            return TradeEditViewModel(coordinator: tabCoordinator, useCase: useCase)
        }
        container.register(TradeEditView.self) { (resolver, category: TradeCategory, trade: Trade?) in
            let viewModel = resolver.resolve(TradeEditViewModel.self)!
            return TradeEditView(viewModel: viewModel, category, trade: trade)
        }
    }
    
}
