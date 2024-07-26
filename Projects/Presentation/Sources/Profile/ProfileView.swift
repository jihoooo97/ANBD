//
//  ProfileView.swift
//  Presentation
//
//  Created by 유지호 on 7/23/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore
import CommonUI

import SwiftUI

public struct ProfileView: View {
    @StateObject private var viewModel: ProfileViewModel
    
    public init(viewModel: ProfileViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        switch viewModel.state {
        case .valid(let user):
            ScrollView {
                VStack {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: user.profileImage)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.g300
                        }
                        .clipShape(.circle)
                        .frame(width: 100, height: 100)
                        .overlay {
                            Circle()
                                .strokeBorder(Color.g300)
                        }
                        
                        HStack {
                            VStack {
                                Text("아")
                                    .anbdFont(.subtitle3)
                                
                                Text("\(user.accuaCount)")
                                    .anbdFont(.subtitle1)
                                    .foregroundStyle(Color.accentColor)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("나")
                                    .anbdFont(.subtitle3)
                                
                                Text("\(user.nanuaCount)")
                                    .anbdFont(.subtitle1)
                                    .foregroundStyle(Color.accentColor)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("바")
                                    .anbdFont(.subtitle3)
                                
                                Text("\(user.baccuaCount)")
                                    .anbdFont(.subtitle1)
                                    .foregroundStyle(Color.accentColor)
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                Text("다")
                                    .anbdFont(.subtitle3)
                                
                                Text("\(user.dasiCount)")
                                    .anbdFont(.subtitle1)
                                    .foregroundStyle(Color.accentColor)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(user.nickname)
                                    .bold()
                                
                                Text(user.favoriteLocation.rawValue)
                            }
                            
                            Text(user.email)
                        }
                        .anbdFont(.caption1)
                        
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationTitle(user.nickname)
            .refreshable {
                await viewModel.getUserInfo(id: user.id)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
        case .invalid:
            Text("invalid ID")
        }
    }
}
