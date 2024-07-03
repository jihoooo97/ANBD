//
//  HomeViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation

public final class HomeViewModel: ObservableObject {
    
    @Published public var coordinator: HomeCoordinator
    
    public init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
}
