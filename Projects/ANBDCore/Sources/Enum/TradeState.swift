//
//  TradeState.swift
//  ANBDCore
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

public enum TradeState: Int, Codable {
    case trading = 0
    case finish
    
    public var description: String {
        switch self {
        case .trading: "거래중"
        case .finish: "거래완료"
        }
    }
}
