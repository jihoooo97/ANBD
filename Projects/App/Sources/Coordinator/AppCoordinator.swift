//
//  AppCoordinator.swift
//  ANBD
//
//  Created by 유지호 on 7/1/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Presentation
import CommonUI
import SwiftUI

final class AppCoordinator: ObservableObject, Coordinator {
    
    @Published var path: NavigationPath
    @Published var flow: AppFlow = .login
    
    private let injector: Injector
    
    
    public init(injector: Injector, flow: AppFlow) {
        self.path = NavigationPath()
        self.injector = injector
    }

    
    public func push(_ scene: AppScene) {
        path.append(scene)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
    
    public func buildRootScene() -> some View {
        return buildScene(flow)
    }
    
    @ViewBuilder
    public func buildScene(_ flow: AppFlow) -> some View {
        switch flow {
        case .login:
            VStack {
                Text("Login Flow")
                Button("Change") {
                    self.flow = .tab
                }
            }
        case .tab:
            TabView {
                VStack {
                    Text("a")
                    Button("Change") {
                        self.flow = .login
                    }
                }
                .tabItem {
                    Label("a", systemImage: "globe")
                }
                
                Text("b")
                    .tabItem {
                        Label("b", systemImage: "globe")
                    }
                
                Text("c")
                    .tabItem {
                        Label("c", systemImage: "globe")
                    }
                
                Text("d")
                    .tabItem {
                        Label("d", systemImage: "globe")
                    }
            }
        }
    }
    
    
}
