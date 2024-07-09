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
//        GeometryReader { proxy in
        ScrollView {
            VStack {
                TabView {
                    ForEach(0..<4, id: \.self) { index in
                        Button {
                            print("\(index)")
                        } label: {
                            Text("\(index)")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundStyle(.white)
                        }
                        .background(.green)
                    }
                }
                .frame(height: 100)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                VStack {
                    HStack {
                        Text("아껴쓰기")
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.article(.accua))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.accentColor)
                        .frame(height: 100)
                }
                
                VStack {
                    HStack {
                        Text("나눠쓰기")
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.trade(.nanua))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<4, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.accentColor)
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                
                VStack {
                    HStack {
                        Text("바꿔쓰기")
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.trade(.baccua))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<4, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.accentColor)
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                
                VStack {
                    HStack {
                        Text("다시쓰기")
                        
                        Spacer()
                        
                        Button {
                            viewModel.push(.article(.dasi))
                        } label: {
                            Text("더보기")
                            
                            Image(systemName: "chevron.right")
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.accentColor)
                        .frame(height: 100)
                }
                
                Button("Logout") {
                    UserDefaults.standard.set(false, forKey: "isLogined")
                }
            }
            .padding()
        }
//        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("ANBD")
                    .anbdFont(.heading2)
                    .foregroundStyle(Color.g900)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.push(.profile)
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.g900)
                }
            }
        }
    }
}
