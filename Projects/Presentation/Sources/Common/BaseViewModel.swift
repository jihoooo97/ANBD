//
//  BaseViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation
import Combine

public class BaseViewModel: ObservableObject {
    
    weak var coordinator: Coordinator?
    
    var cancellables = Set<AnyCancellable>()
    
    
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    
    // MARK: Coordinate
    public func push(_ scene: AppScene) {
        coordinator?.push(scene)
    }
    
    public func pop() {
        coordinator?.pop()
    }
    
    public func popToRoot() {
        coordinator?.popToRoot()
    }
    
    public func present(_ scene: AppScene) {
        coordinator?.present(sheet: scene)
    }
    
    public func dismiss() {
        coordinator?.dismiss()
    }
    
}
