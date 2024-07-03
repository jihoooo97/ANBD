//
//  TabCoordinator.swift
//  ANBD
//
//  Created by 유지호 on 7/2/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Presentation
import CommonUI
import SwiftUI

enum Tab: CaseIterable {
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

final class TabCoordinator: ObservableObject, Coordinator {
    
    private let injector: Injector
    public var type: AppScene = .tab
    
    public var path: NavigationPath
    private var activeTab: Tab = .home
    
    var activeTabBinding: Binding<Tab> {
        Binding(
            get: { self.activeTab },
            set: { self.activeTab = $0 }
        )
    }
    
    
    public init(injector: Injector) {
        self.injector = injector
        self.path = .init()
    }
    
    
    @ViewBuilder
    func startTabCoordinator(of tab: Tab) -> some View {
        switch tab {
        case .home:
            injector.resolve(HomeView.self)
//        case .article:
//            <#code#>
//        case .trade:
//            <#code#>
//        case .chat:
//            <#code#>
//        case .profile:
//            <#code#>
        default:
            Text("\(tab)")
        }
    }
    
    func buildScene() -> some View {
        TabView(selection: activeTabBinding) {
            ForEach(Tab.allCases, id: \.name) {
                self.startTabCoordinator(of: $0)
                    .tabItem(of: $0)
            }
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
