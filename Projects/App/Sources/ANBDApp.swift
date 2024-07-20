import ANBDCore
import Presentation
import CommonUI
import SwiftUI

import FirebaseCore

@main
struct ANBDApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let injector: Injector = DependencyInjector(container: .init())

    @AppStorage("isLogined") private var isLogined = false
    
    @ObservedObject private var loginCoordinator = LoginCoordinator()
    @ObservedObject private var tabCoordinator = TabCoordinator()
    
    init() {
        injector.assemble([
            DataAssembly(),
            DomainAssembly(),
            PresentationAssembly(
                loginCoordinator: loginCoordinator,
                tabCoordinator: tabCoordinator
            )
        ])
        
        loginCoordinator.injector = injector
        tabCoordinator.injector = injector
    }

    var body: some Scene {
        WindowGroup {
            if isLogined {
                tabCoordinator.buildScene(.tab)
                    .sheet(item: $tabCoordinator.sheet) { scene in
                        tabCoordinator.buildScene(scene)
                    }
            } else {
                NavigationStack(path: $loginCoordinator.path) {
                    loginCoordinator.buildScene(.login)
                        .navigationDestination(for: AuthScene.self) { scene in
                            loginCoordinator.buildScene(scene)
                                .environmentObject(injector.resolve(SignUpViewModel.self))
                        }
                        .sheet(item: $loginCoordinator.sheet) { scene in
                            loginCoordinator.buildScene(scene)
                        }
                }
            }
        }
    }
}


