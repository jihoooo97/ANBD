# 🐳 ANBD
> 사용하지 않는 물건을 교환하거나 나눔하고, 절약 방법을 커뮤니티에 공유하여 환경 보호에 기여할 수 있는 플랫폼  
[앱스토어](https://apps.apple.com/kr/app/anbd/id6502585089)
<br>

### 개발 환경 🛠️
| 버전 | iOS 16.0+ |
|:-:|:-:|
| Framework | SwiftUI |
| 구조 | MVVM-C + Combine + Clean Architecture |
| BaaS | FirebaseFirestore |
| Library | Firebase, Kingfisher |
<br>

### 디렉토리 구조 📁
<details>
<summary>더 보기</summary>

#### ANBD
```
ANBD
 ┣ App
 ┃ ┗ ANBDApp.swift
 ┣ Common
 ┃ ┣ Extension
 ┃ ┗ Util
 ┣ Presentaion
 ┃ ┣ ANBDTabView.swift
 ┃ ┣ Authentication
 ┃ ┣ Home
 ┃ ┣ Article
 ┃ ┣ Trade
 ┃ ┣ Chat
 ┃ ┣ Mypage
 ┃ ┣ Report
 ┃ ┣ Search
 ┃ ┗ CommonUI
 ┃   ┣ Button
 ┃   ┣ Picker
 ┃   ┣ Sheet
 ┃   ┣ TextField
 ┃   ┗ View
 ┗ Resource
   ┣ Assets.xcassets
   ┣ Colors.xcassets
   ┣ Font
   ┗ Secrets.xcconfig
```

#### ANBD Model 
```
Sources
 ┣ Data
 ┃ ┣ DataSource
 ┃ ┣ Database
 ┃ ┗ RepositoryImpl
 ┣ Domain
 ┃ ┣ Model
 ┃ ┣ Repository
 ┃ ┗ Usecase/UsecaseImpl
 ┗ Common
   ┣ Enum
   ┣ Error
   ┣ Extension
   ┗ Manager
```
</details>
<br>

### Screen 📱
<details>
<summary>더 보기</summary>
 
### 홈 · 검색
> 아껴쓰기, 나눠쓰기, 바꿔쓰기, 다시쓰기 항목들을 한 눈에 확인할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/d274e3d2-a067-4c1d-9117-13d95ba01248" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/67104e96-7ee8-4ccb-b947-6cc6a471e7cd" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/7b84675d-e4ff-4f8d-83f8-525dbd3bbb6d" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/8f26cbf7-4abd-4a91-9f68-a0b9b3a4c51e" width="180"> |
|--|--|--|--|


### 정보 공유
> **아나바다** 중 아껴쓰기 / 다시쓰기에 해당하는 탭으로 사용자가 알고 있는 물건을 아껴 쓰거나 다시 쓸 수 있는 꿀팁·노하우를 게시할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/1ae13738-74b9-49f9-afc1-21a3389c3506" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/2e9f4333-a65f-4dca-a8ac-9bb133d1b3ea" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/25182bb6-5a08-4dcd-a8da-0f40faf298ae" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/a7416f44-e72c-4a51-9420-a57799fba6f0" width="180"> |
|--|--|--|--|

### 나눔 · 거래
> **아나바다** 중 나눠쓰기 / 바꿔쓰기에 해당하는 탭으로 사용자들이 원하는 물건을 무료나눔 혹은 물물교환할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ff773521-f5d9-44bf-a38f-b46264243df1" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/2e678454-8ee3-4d23-849f-a7c11527a33b" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ad052478-c0a7-4b59-967f-b9b2cbb827c0" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/8c514cd4-c002-4d36-baa8-ed22f4ced94e" width="180"> |
|--|--|--|--|

### 채팅
> 다른 사용자와 **나눔·거래**를 진행할 때 약속을 잡거나 추가적인 정보들을 주고 받을 수 있도록 1:1 채팅을 지원합니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/5b70c116-e63e-47c5-a218-adffac5b3cc5" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/ded19b18-a9dd-4116-bdc6-61196a9b9bf5" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/be61b153-f47b-4b6f-a9e5-6d45663749fd" width="180"> |
|--|--|--|

### 내 정보
> 내가 등록한 정보를 확인하고 수정할 수 있습니다.

| <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/622719a2-fbf4-4e81-b724-3b5c4e0b8acb" width="180"> | <img src="https://github.com/APP-iOS4/ANBD/assets/37467592/61e1764e-cc6d-45a4-9b6e-c6628115b036" width="180"> |
|--|--|

</details>
<br>


## Experience
### 문제 1.
중복되는 비즈니스 로직에 대한 처리: 게시글과 거래글 2종류의 Response 타입이 있었는데 타입만 다를 뿐 로직은 거의 동일하여, 공통부분을 프로토콜과 제네릭으로 추상화하고 다른 로직은 extension을 활용하여 중복 코드를 최소화할 수 있었음

- 개선 전
```swift
public protocol ArticleDataSource {
     func createArticle(article: Article) async throws
     func readArticle(articleID: String) async throws -> Article
     func readRecentArticle(category: ANBDCategory) async throws -> Article
     func readArticleList() async throws -> [Article]
     func refreshAll() async throws -> [Article]
     func updateArticle(article: Article) async throws
     func deleteArticle(articleID: String) async throws
     func resetQuery()
 }

protocol TradeDataSource {
     func createTrade(trade: Trade) async throws
     func readTrade(tradeID: String) async throws -> Trade
     func readTradeList() async throws -> [Trade]
     func readRecentTradeList(category: ANBDCategory) async throws -> [Trade]
     func refreshAll() async throws -> [Trade]
     func updateTrade(trade: Trade) async throws
     func deleteTrade(tradeID: String) async throws
     func resetQuery()
 }
```

- 개선 후
```swift
protocol Postable<Item>: AnyObject {
    associatedtype Item: Codable & Identifiable
    
    func createItem(item: Item) async throws
    func readItem(itemID: String) async throws -> Item
    func readItemList() async throws -> [Item]
    func refreshAll() async throws -> [Item]
    func updateItem(item: Item) async throws
    func deleteItem(itemID: String) async throws
    func resetQuery()
}

extension Postable where Item == Article {

    func readRecentArticle(category: ANBDCategory) async throws -> Article {
        // ...
    }

}

extension Postable where Item == Trade {

    func readRecentTradeList(category: ANBDCategory) async throws -> [Trade] {
        // ...
    }

}
```

### 문제 2.
게시물의 사진 수정 로직: 기존에 게시글 사진 수정 시 모든 사진을 DB에서 지우고 수정한 이미지 배열을 업로드하는 방식으로 구현하였으나 데이터 낭비가 심하다 생각이 들어 사진의 id를 비교하여 추가, 삭제된 것에 대한 처리만 하도록 로직을 수정하였음

- 수정 전
```swift
public func updateImageList(
    path storagePath: StoragePath,
    containerID: String,
    imagePaths: [String],
    imageDatas: [Data]
) async throws -> [String] {
    let storageImagePathList = try await storageRef
        .child(storagePath.rawValue)
        .child(containerID)
        .listAll()
        .items
        .map { $0.name }

    try await deleteImageList(path: storagePath, containerID: containerID, imagePaths: storageImagePathList)
    let updatedPath = try await uploadImageList(path: storagePath, containerID: containerID, imageDatas: imageDatas)

    return updatedPath
}
```

- 수정 후
```swift
public func updateImageList(
    path storagePath: StoragePath,
    containerID: String,
    thumbnailPath: String,
    addImageList: [Data],
    deleteList: [String]
) async throws -> [String] {
    var storagePathList = try await storageRef
        .child(storagePath.rawValue)
        .child(containerID)
        .listAll()
        .items
        .map { $0.name }
        
    try await deleteImageList(
        path: storagePath,
        containerID: containerID,
        imagePaths: deleteList
    )
        
    storagePathList = storagePathList.filter { !deleteList.contains($0) }
        
    if !addImageList.isEmpty {
        let newImagePath = try await uploadImageList(
            path: storagePath,
            isUpdate: true,
            containerID: containerID,
            imageDatas: addImageList
        )
            
        storagePathList += newImagePath
    }
        
    let thumbnailImage = try await downloadImage(
        path: storagePath,
        containerID: containerID,
        imagePath: storagePathList[0]
    )
        
    if let resizedImage = await UIImage(data: thumbnailImage)?
        .byPreparingThumbnail(ofSize: .init(width: 512, height: 512))?
        .jpegData(compressionQuality: 1) {
            
        try await updateImage(
            path: storagePath,
            containerID: "\(containerID)/thumbnail",
            imagePath: thumbnailPath,
            imageData: resizedImage
        )
    }
        
    return storagePathList
}
```
<br>


### Developers 👨🏻‍💻👩🏻‍💻
| <img src="https://avatars.githubusercontent.com/u/80569323?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/103730885?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/72730841?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/100953349?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/49361214?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/90377826?v=4" width="120"> | <img src="https://avatars.githubusercontent.com/u/37467592?v=4" width="120"> |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|[**최주리**](https://github.com/juri123123) <br> **PM**, Trade |[**김기표**](https://github.com/rlvy0513) <br> Article|[**김성민**](https://github.com/marukim365) <br> 로그인 · 회원가입 <br> 마이페이지|[**심상원**](https://github.com/Upcircle2) <br> 관리자 App|[**유지호**](https://github.com/jihoooo97) <br> 모델|[**정운관**](https://github.com/UnGwan) <br> 모델, Chat|[**최정인**](https://github.com/choijungp) <br> Home, Chat|
<br>

### License 🐟 
Copyright iOS 앱 스쿨 4기 TeamGG. All rights reserved.     
Licensed under the [MIT](LICENSE) license.    

<br>
