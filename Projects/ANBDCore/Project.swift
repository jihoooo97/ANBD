import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ANBDCore",
    product: .framework,
    dependencies: [
        .external(name: "FirebaseAuth"),
        .external(name: "FirebaseFirestore"),
        .external(name: "FirebaseMessaging"),
        .external(name: "FirebaseStorage"),
        .external(name: "Swinject")
    ]
)
