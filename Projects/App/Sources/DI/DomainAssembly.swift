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
        // MARK: Article
        container.register(ArticleUseCase.self) { resolver in
            let repository = resolver.resolve(ArticleRepository.self)!
            return ArticleUseCaseImpl(articleRepository: repository)
        }
        
        
        // MARK: Trade
        container.register(TradeUseCase.self) { resolver in
            let repository = resolver.resolve(TradeRepository.self)!
            return TradeUseCaseImpl(tradeRepository: repository)
        }
    }
    
}
