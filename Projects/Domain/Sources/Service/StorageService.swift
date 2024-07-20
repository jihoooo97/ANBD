//
//  StorageService.swift
//  ANBDCore
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import ANBDCore

import UIKit

public final class StorageService {
    
    private let storage = FireStoreDB.storage
    public static let shared = StorageService()
    
    private init() { }
    
    
    public func uploadImage(
        path: StoragePath, 
        id: String,
        image: Data,
        name: String
    ) async throws -> String {
        if id.isEmpty { throw StorageError.emptyID  }
        
        let imageName = name + ".jpeg"
        let ref = storage
            .child(path.name)
            .child(id)
            .child(imageName)
        
        guard let resizedImage = await UIImage(data: image)?
            .byPreparingThumbnail(ofSize: imageName == "thumbnail" ? .init(width: 512, height: 512) : .init(width: 1024, height: 1024))?
            .jpegData(compressionQuality: 1)
        else { throw StorageError.uploadError }
        
        let _ = try await ref.putDataAsync(resizedImage)
        let url = try await ref.downloadURL().absoluteString
        return url
    }
    
    public func uploadImageList(
        path: StoragePath,
        id: String,
        images: [Data]
    ) async throws -> [String] {
        if id.isEmpty { throw StorageError.emptyID  }
        
        var imageURLs: [String] = []
        
        for index in images.indices {
            let url = try await uploadImage(path: path, id: id, image: images[index], name: "\(index)")
            imageURLs.append(url)
        }
        
        return imageURLs
    }
    
    
    public func downloadImage(
        path: StoragePath,
        id: String,
        imageName: String
    ) async throws -> URL {
        if id.isEmpty { throw StorageError.emptyID }
        if imageName.isEmpty { throw StorageError.emptyImageName }
        
        guard let url = try? await storage
            .child(path.name)
            .child(id)
            .child(imageName)
            .downloadURL()
        else { throw StorageError.downloadError }
        
        return url
    }
    
    public func downloadImageList(
        path: StoragePath,
        id: String
    ) async throws -> [URL] {
        if id.isEmpty { throw StorageError.emptyID }
        
        var urls: [URL] = []
        
        let images = try await storage
            .child(path.name)
            .child(id)
            .listAll()
            .items
        
        for image in images {
            let url = try await image.downloadURL()
            urls.append(url)
        }
                
        return urls
    }
    
}


public enum StoragePath {
    case article
    case trade
    case profile
    
    public var name: String {
        switch self {
        case .article: "Article"
        case .trade:   "Trade"
        case .profile: "Profile"
        }
    }
}

public enum StorageError: LocalizedError {
    case emptyID
    case emptyImageName
    case uploadError
    case downloadError
    
    public var errorDescription: String? {
        switch self {
        case .emptyID:        "ID가 비어있습니다."
        case .emptyImageName: "Image 이름이 비어있습니다."
        case .uploadError:    "업로드에 실패했습니다."
        case .downloadError:  "다운로드에 실패했습니다."
        }
    }
}
