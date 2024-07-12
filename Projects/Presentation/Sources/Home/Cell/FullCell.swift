//
//  FullCell.swift
//  Presentation
//
//  Created by 유지호 on 7/12/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import SwiftUI

struct FullCell: View {
    private let storageService = StorageService()
    private let article: Article
    
    @State private var imageURL: URL?
    
    public init(article: Article?) {
        self.article = article ?? .default
    }
    
    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.g300
                .overlay {
                    ProgressView()
                }
        }
        .frame(height: 100)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(alignment: .bottomLeading) {
            Text(article.title)
                .anbdFont(.subtitle2)
                .foregroundStyle(.white)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
//        .task {
//            guard imageURL == nil else { return }
//            imageURL = await downloadImageURL(path: .article, id: article.id, imageName: article.thumbnailImagePath)
//        }
    }
    
//    private func downloadImageURL(path: StoragePath, id: String, imageName: String) async -> URL {
//        do {
//            let url = try await storageService.downloadImage(path: path, id: id, imageName: "thumbnail/" + imageName)
//            return url
//        } catch {
//            print(error.localizedDescription)
//            return URL(string: "https://firebasestorage.googleapis.com/v0/b/anbd-project3.appspot.com/o/Profile%2FDefaultUserProfileImage.png?alt=media&token=fc0e56d9-6855-4ead-ab28-d8ff789799b3")!
//        }
//    }
}
