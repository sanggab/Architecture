//
//  Test.swift
//  Architecture
//
//  Created by Gab on 3/14/25.
//

import SwiftUI

// 📌 1. 페이지와 함께 데이터를 담을 Enum 정의
enum AppRoute: Hashable {
    case detail(item: Item)     // 데이터를 함께 전달하는 페이지
    case settings               // 단순 페이지 이동
}

// 전달할 데이터 모델
struct Item: Identifiable, Hashable {
    let id = UUID()
    let name: String
}

// 📌 2. 첫 번째 화면 (Navigation Stack을 이용)
