//
//  CoordinatorModifier.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import MapFeature
import LikesyouFeature

struct CoordinatorModifier: ViewModifier {
    @EnvironmentObject private var coordinator: Coordinator
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Page.self) { page in
                switch page {
                case .map:
                    MapFeatureView(coordinator: coordinator.mapViewCoordinatorInterface)
                case .likesyou:
                    LikesyouFeatureView()
                default:
                    EmptyView()
//                case .likesyou:
//                    
//                case .messageList:
//                    
//                case .message:
//
                }
            }
    }
}
