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
        // MARK: Article
        container.register(ArticleRepository.self) { resolver in
            return ArticleRepositoryImpl()
        }
    }
    
}
