//
//  CoordinatorModifier.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import Features

struct CoordinatorModifier: ViewModifier {
    @EnvironmentObject private var coordinator: Coordinator
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Page.self) { page in
                switch page {
                case .first:
                    FirstMainView(coordinator: coordinator.first)
                case .second:
                    SecondMainView()
                case .third:
                    ThirdMainView()
                }
            }
    }
}
