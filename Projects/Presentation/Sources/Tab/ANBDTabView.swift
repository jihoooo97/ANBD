//
//  ANBDTabView.swift
//  Presentation
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct ANBDTabView: View {
    @ObservedObject private var coordinator: TabCoordinator
    
    private let homeView: HomeView
    private let articleView: ArticleView
    private let tradeView: TradeView
    
    public init(
        coordinator: TabCoordinator,
        homeView: HomeView,
        articleView: ArticleView,
        tradeView: TradeView
    ) {
        self.coordinator = coordinator
        self.homeView = homeView
        self.articleView = articleView
        self.tradeView = tradeView
    }
    
    public var body: some View {
        TabView(selection: $coordinator.selection) {
            NavigationStack(path: $coordinator.homePath) {
                homeView
                    .navigationDestination(for: TabScene.self) { scene in
                        coordinator.buildScene(scene)
                            .toolbarRole(.editor)
                    }
            }
            .tabItem(of: .home)
            
            NavigationStack(path: $coordinator.articlePath) {
                articleView
                    .navigationTitle("정보 공유")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: TabScene.self) { scene in
                        coordinator.buildScene(scene)
                            .toolbarRole(.editor)
                    }
            }
            .tabItem(of: .article)
            
            NavigationStack(path: $coordinator.tradePath) {
                tradeView
                    .navigationTitle("나눔 거래")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: TabScene.self) { scene in
                        coordinator.buildScene(scene)
                            .toolbarRole(.editor)
                    }
            }
            .tabItem(of: .trade)
        }
    }
}


fileprivate struct TabItem: ViewModifier {
    let tab: ANBDTab
    
    func body(content: Content) -> some View {
        content
            .tag(tab)
            .tabItem {
                Label(tab.name, systemImage: tab.iconName)
            }
    }
}

fileprivate extension View {
    
    func tabItem(of tab: ANBDTab) -> some View {
        modifier(TabItem(tab: tab))
    }
    
}
