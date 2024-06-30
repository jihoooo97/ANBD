// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [:]
    )
#endif

let package = Package(
    name: "ANBD",
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.23.0")),
        .package(url: "https://github.com/Swinject/Swinject.git", .upToNextMajor(from: "2.8.0"))
    ]
)
