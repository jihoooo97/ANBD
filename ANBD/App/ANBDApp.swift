//
//  ANBDApp.swift
//  ANBD
//
//  Created by 유지호 on 6/30/24.
//

import SwiftUI
import Swinject

@main
struct ANBDApp: App {
    private let injector: Injector
    
    init() {
        self.injector = DependencyInjector(container: .init())
        injector.assemble([
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
