import ANBDCore
import Presentation
import CommonUI
import SwiftUI

import FirebaseCore

@main
struct ANBDApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private let injector: Injector = DependencyInjector.shared

    @AppStorage("uid") private var isLogined: String?
    
    @StateObject private var signUpViewModel: SignUpViewModel = DependencyInjector.shared.resolve(SignUpViewModel.self)
    
    @ObservedObject private var loginCoordinator = LoginCoordinator.shared
    @ObservedObject private var tabCoordinator = TabCoordinator.shared
    
    init() {
        injector.assemble([
            DataAssembly(),
            DomainAssembly(),
            PresentationAssembly()
        ])
    }

    var body: some Scene {
        WindowGroup {
            if let isLogined {
                tabCoordinator.buildScene(.tab)
                    .sheet(item: $tabCoordinator.sheet) { scene in
                        tabCoordinator.buildScene(scene)
                    }
            } else {
                NavigationStack(path: $loginCoordinator.path) {
                    loginCoordinator.buildScene(.login)
                        .navigationDestination(for: AuthScene.self) { scene in
                            loginCoordinator.buildScene(scene)
                                .environmentObject(signUpViewModel)
                        }
                        .sheet(item: $loginCoordinator.sheet) { scene in
                            loginCoordinator.buildScene(scene)
                        }
                }
            }
        }
    }
}


