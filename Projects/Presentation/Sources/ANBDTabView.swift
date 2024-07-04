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
    @State private var selection: Tab = .home
    
    private let homeView: HomeView
    
    public init(
        homeView: HomeView
    ) {
        self.homeView = homeView
    }
    
    public var body: some View {
        TabView(selection: $selection) {
            homeView
                .tabItem(of: .home)
        }
    }
}


public enum Tab: CaseIterable {
    case home
    case article
    case trade
    case chat
    case profile
    
    var name: String {
        switch self {
        case .home:    "홈"
        case .article: "정보 공유"
        case .trade:   "나눔·거래"
        case .chat:    "채팅"
        case .profile: "내 정보"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:    "house"
        case .article: "leaf"
        case .trade:   "arrow.3.trianglepath"
        case .chat:    "bubble.right"
        case .profile: "person.fill"
        }
    }
}

fileprivate struct TabItem: ViewModifier {
    let tab: Tab
    
    func body(content: Content) -> some View {
        content
            .tag(tab)
            .tabItem {
                Label(tab.name, systemImage: tab.iconName)
            }
    }
}

fileprivate extension View {
    
    func tabItem(of tab: Tab) -> some View {
        modifier(TabItem(tab: tab))
    }
    
}
