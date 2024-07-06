//
//  SignUpTermsView.swift
//  Presentation
//
//  Created by 유지호 on 7/4/24.
//  Copyright © 2024 jiho. All rights reserved.
//

import CommonUI
import SwiftUI

public struct SignUpTermsView: View {
    @EnvironmentObject private var viewModel: SignUpViewModel
    
    @State private var isOlderThanFourteen: Bool = false
    @State private var isAgreeToService: Bool = false
    @State private var isAgreeToCollectInfo: Bool = false
    @State private var isAgreeToMarketing: Bool = false
    
    public init() { }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("회원가입")
                .padding(.bottom, 48)
                .anbdFont(.heading2)
            
            Text("서비스 이용 약관")
                .anbdFont(.heading3)
                .foregroundStyle(Color.g900)
            
            Button {
                toggleAllAgree()
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: isAllAgree ? "checkmark.circle.fill" :"checkmark.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(isAllAgree ? Color.accentColor : .g200)
                    
                    Text("모두 동의 (선택 정보 포함)")
                        .anbdFont(.subtitle2)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            Divider()
            
            VStack {
                TermsOfServiceButton(
                    "만 14세 이상입니다. (필수)",
                    $isOlderThanFourteen
                )
                
                TermsOfServiceButton(
                    "서비스 이용약관에 동의 (필수)",
                    $isAgreeToService
                ) {
                    viewModel.present(.termsDetail(.agreeToService))
                }
                
                TermsOfServiceButton(
                    "개인정보 수집 및 이용에 동의 (필수)",
                    $isAgreeToCollectInfo
                ) {
                    viewModel.present(.termsDetail(.agreeToCollectInfo))
                }
                
                TermsOfServiceButton(
                    "광고 및 마케팅 수신에 동의 (선택)",
                    $isAgreeToMarketing
                ) {
                    viewModel.present(.termsDetail(.agreeToMarketing))
                }
            }
            .padding(.horizontal, 4)
            
            Spacer()
            
            RoundedButton(
                "가입 완료",
                disabled: !isEssentialAgree
            ) {
                UserDefaults.standard.set(true, forKey: "isLogined")
                viewModel.popToRoot()
            }
            .frame(height: 56)
            .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .toolbarRole(.editor)
    }
    
    var isAllAgree: Bool {
        return isEssentialAgree && isAgreeToMarketing
    }
    
    var isEssentialAgree: Bool {
        return isOlderThanFourteen && isAgreeToService && isAgreeToCollectInfo
    }
    
    func toggleAllAgree() {
        if !isAllAgree {
            isOlderThanFourteen = true
            isAgreeToService = true
            isAgreeToCollectInfo = true
            isAgreeToMarketing = true
        } else {
            isOlderThanFourteen.toggle()
            isAgreeToService.toggle()
            isAgreeToCollectInfo.toggle()
            isAgreeToMarketing.toggle()
        }
    }
}

#Preview {
    SignUpTermsView()
}
