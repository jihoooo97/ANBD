import CommonUI
import SwiftUI
import Swinject

@main
struct ANBDApp: App {
    private let injector: Injector
    
    @ObservedObject private var appCoordinator: AppCoordinator
    
    init() {
        self.injector = DependencyInjector(container: .init())
        injector.assemble([
            CoreAssembly(),
            PresentationAssembly()
        ])
        
        appCoordinator = AppCoordinator(injector: injector, flow: .login)
    }

    var body: some Scene {
        WindowGroup {
            appCoordinator.buildRootScene()
                .environmentObject(appCoordinator)
        }
    }
}
