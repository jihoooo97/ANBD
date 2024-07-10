//
//  StorageService.swift
//  ANBDCore
//
//  Created by 유지호 on 7/10/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import Foundation
import FirebaseStorage

public protocol StorageServiceInterface {
    func uploadImage(path: StoragePath, id: String, image: Data) async throws -> String
    func downloadImage(path: StoragePath, id: String, imageName: String) async throws -> URL
    func downloadImageList(path: StoragePath, id: String) async throws -> [URL]
}

public final class StorageService: StorageServiceInterface {
    
    private let storage = FireStoreDB.storage
    
    
    public init() { }
    
    
    public func uploadImage(
        path: StoragePath, 
        id: String,
        image: Data
    ) async throws -> String {
        if id.isEmpty { throw StorageError.emptyID  }
        
        let imageName = "\(UUID().uuidString).jpeg"
        guard let _ = try? await storage
            .child(path.name)
            .child(id)
            .child(imageName)
            .putDataAsync(image)
        else {
            throw StorageError.uploadError
        }
        
        return imageName
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
