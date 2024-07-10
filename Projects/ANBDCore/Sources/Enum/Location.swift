//
//  Location.swift
//  ANBDCore
//
//  Created by 유지호 on 7/11/24.
//  Copyright © 2024 jiho. All rights reserved.
//

public enum Location: Codable, CaseIterable, Identifiable {
    case seoul
    case gyeonggi
    case incheon
    case gwangju
    case busan
    case dague
    case daejeon
    case ulsan
    case gangwon
    case gyeongBuk
    case gyeongNam
    case jeonBuk
    case jeonNam
    case chungBuk
    case chungNam
    case sejong
    case jeju
    
    public var name: String {
        switch self {
        case .seoul:     "서울"
        case .gyeonggi:  "경기"
        case .incheon:   "인천"
        case .gwangju:   "광주"
        case .busan:     "부산"
        case .dague:     "대구"
        case .daejeon:   "대전"
        case .ulsan:     "울산"
        case .gangwon:   "강원"
        case .gyeongBuk: "경북"
        case .gyeongNam: "경남"
        case .jeonBuk:   "전북"
        case .jeonNam:   "전남"
        case .chungBuk:  "충북"
        case .chungNam:  "충남"
        case .sejong:    "세종"
        case .jeju:      "제주"
        }
    }
    
    public var id: String { "\(self)" }
}
