//
//  PresentationAssembly.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Presentation

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
            let articleView = resolver.resolve(ArticleView.self, argument: ArticleCategory.accua)!
            let tradeView = resolver.resolve(TradeView.self, argument: TradeCategory.nanua)!
            
            return ANBDTabView(
                coordinator: tabCoordinator,
                homeView: homeView,
                articleView: articleView,
                tradeView: tradeView
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
            return ArticleViewModel(coordinator: tabCoordinator)
        }
        
        container.register(ArticleView.self) { (resolver, category: ArticleCategory) in
            let viewModel = resolver.resolve(ArticleViewModel.self)!
            return ArticleView(viewModel: viewModel, category)
        }
        
        container.register(ArticleDetailViewModel.self) { (resolver, article: Article) in
            return ArticleDetailViewModel(coordinator: tabCoordinator, article: article)
        }
        
        container.register(ArticleDetailView.self) { (resolver, article: Article) in
            let viewModel = resolver.resolve(ArticleDetailViewModel.self, argument: article)!
            return ArticleDetailView(viewModel: viewModel)
        }
        
        container.register(ArticleEditView.self) { (resolver, isEditMode: Bool, selection: ArticleCategory, article: String?) in
            return ArticleEditView(isEditMode: isEditMode, selection, article: article)
        }
        
        
        // MARK: Trade
        container.register(TradeViewModel.self) { resolver in
            return TradeViewModel(coordinator: tabCoordinator)
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
        
        container.register(TradeEditView.self) { (resolver, category: TradeCategory, trade: Trade?) in
            return TradeEditView(category, trade: trade)
        }
    }
    
}
