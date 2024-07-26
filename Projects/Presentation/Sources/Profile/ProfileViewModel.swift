//
//  ProfileViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/23/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import Domain

import Foundation

public final class ProfileViewModel: BaseViewModel<TabCoordinator> {
    
    private let authUseCase: AuthUseCase
    private let userUseCase: UserUseCase
    
    @Published private(set) var state: State = .invalid
    
    
    public init(
        coordinator: TabCoordinator,
        authUseCase: AuthUseCase,
        userUseCase: UserUseCase,
        id: String
    ) {
        self.authUseCase = authUseCase
        self.userUseCase = userUseCase
        
        super.init(coordinator: coordinator)
        
        Task {
            await getUserInfo(id: id)
        }
    }
    
    
    public func getUserInfo(id: String) async {
        do {
            let userInfo = try await userUseCase.getUserInfo(id: id)
            
            await MainActor.run {
                state = .valid(userInfo)
            }
        } catch {
            print(error.localizedDescription)
            
            await MainActor.run {
                state = .invalid
            }
        }
    }
    
    enum State {
        case valid(User)
        case invalid
    }
    
}
