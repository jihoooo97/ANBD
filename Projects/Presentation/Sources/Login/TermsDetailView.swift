//
//  TermsDetailView.swift
//  Presentation
//
//  Created by 유지호 on 7/5/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import SwiftUI
import SafariServices

public struct TermsDetailView: View {
    private let type: TermsType
    
    public init(type: TermsType) {
        self.type = type
    }
    
    public var body: some View {
        if let url = URL(string: type.url) {
            SafariView(url: url)
        } else {
            Text("잘못된 URL입니다.")
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<SafariView>
    ) {

    }
}
