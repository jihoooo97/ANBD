import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let classNameAttribute: Template.Attribute = .required("class_name")
let appPath = "Projects/App"

let template = Template(
    description: "App Template",
    attributes: [
        nameAttribute,
        classNameAttribute
    ],
    items: [
        .file(
            path: appPath + "/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: appPath + "/Sources/\(classNameAttribute)App.swift",
            templatePath: "ProjectApp.stencil"
        ),
        .directory(
            path: appPath + "/Resources",
            sourcePath: "Assets.xcassets"
        ),
        .file(
            path: appPath + "/Tests/\(classNameAttribute)Tests.swift",
            templatePath: "AppTests.stencil"
        )
    ]
)

