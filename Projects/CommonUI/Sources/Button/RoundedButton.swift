//
//  RoundedButton.swift
//  CommonUI
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI

public struct RoundedButton: View {
    let title: String
    let foregroundColor: Color
    let disabled: Bool
    let buttonAction: () -> ()
    
    public init(
        _ title: String,
        foregroundColor: Color = .accentColor,
        disabled: Bool,
        buttonAction: @escaping () -> Void
    ) {
        self.title = title
        self.foregroundColor = foregroundColor
        self.disabled = disabled
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        Button {
            buttonAction()
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .fill(disabled ? Color.g300 : foregroundColor)
                .overlay {
                    Text(title)
                        .foregroundStyle(.white)
                }
        }
        .disabled(disabled)
    }
}
