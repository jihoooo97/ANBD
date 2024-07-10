//
//  FireStoreDB.swift
//  ANBDCore
//
//  Created by 유지호 on 7/9/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import FirebaseFirestore
import FirebaseStorage

public enum FireStoreDB {
    
    public static var user: CollectionReference {
        Firestore.firestore().collection("User")
    }
    
    public static var article: CollectionReference {
        Firestore.firestore().collection("ArticleBoard")
    }
    
    public static var comment: CollectionReference {
        Firestore.firestore().collection("CommentBoard")
    }
    
    public static var trade: CollectionReference {
        Firestore.firestore().collection("TradeBoard")
    }
    
    public static var chat: CollectionReference {
        Firestore.firestore().collection("ChatRoom")
    }
    
    public static var banner: CollectionReference {
        Firestore.firestore().collection("Banner")
    }
    
    public static var storage: StorageReference {
        Storage.storage().reference()
    }
    
}
