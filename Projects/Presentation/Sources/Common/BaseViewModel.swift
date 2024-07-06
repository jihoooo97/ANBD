//
//  BaseViewModel.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation
import Combine

public class BaseViewModel<C: Coordinator>: ObservableObject {
    
    weak var coordinator: C?
    
    var cancellables = Set<AnyCancellable>()
    
    
    public init(coordinator: C) {
        self.coordinator = coordinator
    }
    
    
    // MARK: Coordinate
    public func push(_ scene: C.S) {
        coordinator?.push(scene)
    }
    
    public func pop() {
        coordinator?.pop()
    }
    
    public func popToRoot() {
        coordinator?.popToRoot()
    }
    
    public func present(_ scene: C.S) {
        coordinator?.present(scene)
    }
    
    public func dismiss() {
        coordinator?.dismiss()
    }
    
}
