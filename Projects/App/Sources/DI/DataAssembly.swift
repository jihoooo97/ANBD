//
//  DataAssembly.swift
//  ANBD
//
//  Created by 유지호 on 7/21/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Data
import Domain

import Swinject

struct DataAssembly: Assembly {
    
    func assemble(container: Container) {
        // MARK: Auth
        container.register(AuthRepository.self) { resolver in
            return AuthRepositoryImpl()
        }
        
        
        // MARK: User
        container.register(UserRepository.self) { resolver in
            return UserRepositoryImpl()
        }
        
        
        // MARK: Article
        container.register(ArticleRepository.self) { resolver in
            return ArticleRepositoryImpl()
        }
        
        
        // MARK: Comment
        container.register(CommentRepository.self) { resolver in
            return CommentRepositoryImpl()
        }
        
        
        // MARK: Trade
        container.register(TradeRepository.self) { resolver in
            return TradeRepositoryImpl()
        }
    }
    
}
