//
//  Injector.swift
//  ANBD
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Swinject

public protocol Assemblable {
    func assemble(_ assemblyList: [Assembly])
    func register<T>(_ serviceType: T.Type, _ object: T)
}

public protocol Resolvable {
    func resolve<T>(_ serviceType: T.Type) -> T
    func resolve<T, Arg>(_ serviceType: T.Type, arg: Arg) -> T
    func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arg1: Arg1, arg2: Arg2) -> T
    func resolve<T, Arg1, Arg2, Arg3>(_ serviceType: T.Type, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> T
}

public typealias Injector = Assemblable & Resolvable


public final class DependencyInjector: Injector {
    
    private let container: Container
    
    public init(container: Container) {
        self.container = container
    }
    
    public func assemble(_ assemblyList: [Assembly]) {
        assemblyList.forEach {
            $0.assemble(container: container)
        }
    }
    
    public func register<T>(_ serviceType: T.Type, _ object: T) {
        container.register(serviceType) { _ in object }
    }
    
    public func resolve<T>(_ serviceType: T.Type) -> T {
        container.resolve(serviceType)!
    }
    
    public func resolve<T, Arg>(_ serviceType: T.Type, arg: Arg) -> T {
        container.resolve(serviceType, argument: arg)!
    }
    
    public func resolve<T, Arg1, Arg2>(_ serviceType: T.Type, arg1: Arg1, arg2: Arg2) -> T {
        container.resolve(serviceType, arguments: arg1, arg2)!
    }
    
    public func resolve<T, Arg1, Arg2, Arg3>(_ serviceType: T.Type, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> T {
        container.resolve(serviceType, arguments: arg1, arg2, arg3)!
    }
    
}
