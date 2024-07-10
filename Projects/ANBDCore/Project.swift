import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ANBDCore",
    product: .staticFramework,
    dependencies: [
        .external(name: "FirebaseAuth"),
        .external(name: "FirebaseFirestore"),
        .external(name: "FirebaseMessaging"),
        .external(name: "FirebaseStorage"),
        .external(name: "Swinject")
    ]
)
