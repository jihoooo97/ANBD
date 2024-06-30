import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CommonUI",
    product: .staticFramework,
    dependencies: [
        .project(
            target: "ANBDCore",
            path: .relativeToRoot("Projects/ANBDCore")
        )
    ]
)
