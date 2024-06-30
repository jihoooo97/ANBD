import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let featurePath = "Projects/\(nameAttribute)"

let template = Template(
    description: "Feature Template",
    attributes: [
        nameAttribute
    ],
    items: [
        .file(
            path: featurePath + "/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: featurePath + "/Sources/\(nameAttribute)View.swift",
            templatePath: "View.stencil"
        ),
        .file(
            path: featurePath + "/Tests/\(nameAttribute)Tests.swift",
            templatePath: "FeatureTests.stencil"
        ),
    ]
)
