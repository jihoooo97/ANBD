import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let corePath = "Projects/\(nameAttribute)Core"

let template = Template(
    description: "Core Template",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
            path: corePath + "/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: corePath + "/Sources/\(nameAttribute)Core.swift",
            templatePath: "Core.stencil"
        ),
        .file(
            path: corePath + "/Tests/\(nameAttribute)Tests.swift",
            templatePath: "CoreTests.stencil"
        ),
    ]
)

