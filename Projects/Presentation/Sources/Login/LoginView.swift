//
//  LoginView.swift
//  Presentation
//
//  Created by 유지호 on 7/3/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct LoginView: View {
    @ObservedObject private var viewModel: LoginViewModel
    
    public init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        NavigationStack(path: $viewModel.coordinator.path) {
            VStack {
                Text("Hello, Login~")
                
                Button("Change") {
                    UserDefaults.standard.set(true, forKey: "isLogined")
                }
                
                Button("Sign Up") {
                    viewModel.moveToSignUpView()
                }
            }
            .navigationDestination(for: AppScene.self) { scene in
                viewModel.coordinator.buildScene(scene)
            }
        }
        .environmentObject(viewModel)
    }
}
