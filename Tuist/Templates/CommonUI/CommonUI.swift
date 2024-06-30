import ProjectDescription

let commonUIPath = "Projects/CommonUI"

let template = Template(
    description: "CommonUI Template",
    attributes: [],
    items: [
        .file(
            path: commonUIPath + "/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: commonUIPath + "/Sources/CommonUI.swift",
            templatePath: "CommonUI.stencil"
        )
    ]
)

