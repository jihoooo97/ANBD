import Presentation
import CommonUI
import SwiftUI
import Swinject

@main
struct ANBDApp: App {
    private let injector: Injector = DependencyInjector(container: .init())
    
    @AppStorage("isLogined") private var isLogined = false
    
    @ObservedObject private var appCoordinator = AppCoordinator()
    
    init() {
        injector.assemble([
            CoreAssembly(),
            PresentationAssembly(coordinator: appCoordinator)
        ])
        
        appCoordinator.injector = injector
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.buildRootScene(isLogined)
                    .navigationDestination(for: AppScene.self) { scene in
                        appCoordinator.buildScene(scene)
                            .environmentObject(injector.resolve(SignUpViewModel.self))
                    }
                    .sheet(item: $appCoordinator.sheet) { scene in
                        appCoordinator.buildScene(scene)
                    }
            }
        }
    }
}


