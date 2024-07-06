//
//  HomeView.swift
//  Presentation
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text("Hello, Home!")
            
            Button("Push") {
                viewModel.push(.profile)
            }
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: "isLogined")
            }
        }
    }
}
