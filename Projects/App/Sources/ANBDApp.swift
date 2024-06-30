import CommonUI
import SwiftUI
import Swinject

@main
struct ANBDApp: App {
    private let injector: Injector
    
    init() {
        self.injector = DependencyInjector(container: .init())
        injector.assemble([
            CoreAssembly(),
            PresentationAssembly()
        ])
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
