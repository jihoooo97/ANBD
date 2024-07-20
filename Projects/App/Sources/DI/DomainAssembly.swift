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
            return ArticleUseCase(articleRepository: repository)
        }
    }
    
}
