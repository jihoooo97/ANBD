//
//  Project.swift
//  ANBDCoreManifests
//
//  Created by 유지호 on 7/19/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Domain",
    product: .framework,
    dependencies: [
        .project(
            target: "ANBDCore",
            path: .relativeToRoot("Projects/ANBDCore")
        )
    ]
)
