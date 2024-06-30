import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Presentation",
    product: .staticFramework,
    dependencies: [
        .project(
            target: "ANBDCore",
            path: .relativeToRoot("Projects/ANBDCore")
        ),
        .project(
            target: "CommonUI",
            path: .relativeToRoot("Projects/CommonUI")
        )
    ]
)
