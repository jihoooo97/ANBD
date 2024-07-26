//
//  DomainAssembly.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Domain

import Swinject

struct DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        // MARK: Auth
        container.register(AuthUseCase.self) { resolver in
            let authRepository = resolver.resolve(AuthRepository.self)!
            let userRepository = resolver.resolve(UserRepository.self)!
            return AuthUseCaseImpl(authRepository: authRepository, userRepository: userRepository)
        }
        
        
        // MARK: User
        container.register(UserUseCase.self) { resolver in
            let authRepository = resolver.resolve(AuthRepository.self)!
            let userRepository = resolver.resolve(UserRepository.self)!
            return UserUseCaseImpl(userRepository: userRepository)
        }
        
        
        // MARK: Article
        container.register(ArticleUseCase.self) { resolver in
            let repository = resolver.resolve(ArticleRepository.self)!
            return ArticleUseCaseImpl(articleRepository: repository)
        }
        
        
        // MARK: Comment
        container.register(CommentUseCase.self) { resolver in
            let commentRepository = resolver.resolve(CommentRepository.self)!
            return CommentUseCaseImpl(commentRepository: commentRepository)
        }
        
        
        // MARK: Trade
        container.register(TradeUseCase.self) { resolver in
            let repository = resolver.resolve(TradeRepository.self)!
            return TradeUseCaseImpl(tradeRepository: repository)
        }
    }
    
}
