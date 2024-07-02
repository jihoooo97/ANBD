import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ANBD",
    product: .app,
    infoPlist: .file(path: "Resources/Info.plist"),
    resources: ["Resources/**"],
    dependencies: [
        .project(
            target: "ANBDCore",
            path: .relativeToRoot("Projects/ANBDCore")
        ),
        .project(
            target: "Presentation",
            path: .relativeToRoot("Projects/Presentation")
        ),
        .external(name: "Swinject"),
        .external(name: "FirebaseAuth"),
        .external(name: "FirebaseMessaging")
    ]
)
