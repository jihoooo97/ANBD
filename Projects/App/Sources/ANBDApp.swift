import Presentation
import CommonUI
import SwiftUI
import Swinject

@main
struct ANBDApp: App {
    private let injector: Injector
    
    @AppStorage("isLogined") private var isLogined = false
    @ObservedObject private var appCoordinator: AppCoordinator
    
    init() {
        self.injector = DependencyInjector(container: .init())
        appCoordinator = AppCoordinator(injector: injector)
        
        injector.assemble([
            CoreAssembly(),
            PresentationAssembly(injector: injector)
        ])
    }

    var body: some Scene {
        WindowGroup {
            appCoordinator.buildRootScene(isLogined)
        }
    }
}
