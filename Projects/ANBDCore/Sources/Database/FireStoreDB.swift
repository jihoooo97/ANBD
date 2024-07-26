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
        Firestore.firestore().collection("TestUser")
    }
    
    public static var article: CollectionReference {
        Firestore.firestore().collection("TestArticle")
    }
    
    public static var comment: CollectionReference {
        Firestore.firestore().collection("TestComment")
    }
    
    public static var trade: CollectionReference {
        Firestore.firestore().collection("TestTrade")
    }
    
    public static var chat: CollectionReference {
        Firestore.firestore().collection("TestChatRoom")
    }
    
    public static var banner: CollectionReference {
        Firestore.firestore().collection("Banner")
    }
    
    public static var storage: StorageReference {
        Storage.storage().reference()
    }
    
}
