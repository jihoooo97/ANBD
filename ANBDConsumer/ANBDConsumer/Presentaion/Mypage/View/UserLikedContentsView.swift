//
//  UserLikedContentsView.swift
//  ANBDConsumer
//
//  Created by 김성민 on 4/12/24.
//

import SwiftUI
import ANBDModel

struct UserLikedContentsView: View {
    @EnvironmentObject private var myPageViewModel: MyPageViewModel
    @EnvironmentObject private var tradeViewModel: TradeViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    @State var category: ANBDCategory
    
    var body: some View {
        VStack {
            CategoryDividerView(category: $category)
                .frame(height: 20)
                .padding([.leading, .trailing, .bottom])
            
            switch category {
            case .accua, .dasi:
                TabView(selection: $category) {
                    userLikedArticleListView(list: myPageViewModel.userLikedAccuaArticles)
                        .tag(ANBDCategory.accua)
                    
                    userLikedArticleListView(list: myPageViewModel.userLikedDasiArticles)
                        .tag(ANBDCategory.dasi)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(edges: .bottom)
                
            case .nanua, .baccua:
                TabView(selection: $category) {
                    userHeartTradeListView(list: myPageViewModel.userHeartedNanuaTrades)
                        .tag(ANBDCategory.nanua)
                    
                    userHeartTradeListView(list: myPageViewModel.userHeartedBaccuaTrades)
                        .tag(ANBDCategory.baccua)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(edges: .bottom)
            }
        }
        .navigationTitle("\(navigationTitile)")
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbarRole(.editor)
        .toolbar(.hidden, for: .tabBar)
        
        .onAppear {
            Task {
                await myPageViewModel.loadUserLikedArticles(user: UserStore.shared.user)
                await myPageViewModel.loadUserHeartedTrades(user: UserStore.shared.user)
                
                myPageViewModel.filterUserLikedAndHeartedList()
            }
        }
    }
    
    @ViewBuilder
    private func userLikedArticleListView(list: [Article]) -> some View {
        if list.isEmpty {
            ListEmptyView(description: "\(UserStore.shared.user.nickname)님이 좋아요한\n\(category.description) 게시글이 없습니다.")
        } else {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(list) { article in
                        ArticleListCell(value: .article(article))
                            .padding(.vertical, 5)
                            .onTapGesture {
                                coordinator.article = article
                                coordinator.appendPath(.articleDeatilView)
                            }
                        
                        Divider()
                    }
                }
                .padding(.horizontal, 20)
                .background(Color(UIColor.systemBackground))
            }
            .background(.gray50)
        }
    }
    
    @ViewBuilder
    private func userHeartTradeListView(list: [Trade]) -> some View {
        if list.isEmpty {
            ListEmptyView(description: "\(UserStore.shared.user.nickname)님이 찜한\n\(category.description) 거래가 없습니다.")
        } else {
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(list) { trade in
                        ArticleListCell(value: .trade(trade))
                            .padding(.vertical, 5)
                            .onTapGesture {
                                coordinator.trade = trade
                                tradeViewModel.getOneTrade(trade: trade)
                                coordinator.appendPath(.tradeDetailView)
                            }
                        
                        Divider()
                    }
                }
                .padding(.horizontal, 20)
                .background(Color(UIColor.systemBackground))
            }
            .background(.gray50)
        }
    }
}

extension UserLikedContentsView {
    private var navigationTitile: String {
        switch category {
        case .accua, .dasi:
            return "좋아요한 게시글"
        case .nanua, .baccua:
            return "찜한 나눔 · 거래"
        }
    }
}

#Preview {
    NavigationStack {
        UserLikedContentsView(category: .accua)
            .environmentObject(MyPageViewModel())
            .environmentObject(ArticleViewModel())
    }
}