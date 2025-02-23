//
//  CoordinatorModifier.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import MapFeature
import LikesyouFeature
import TestViewFeature
import TestViewInterface

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
                case .test:
                    TestViewFeatureView(sceneModel: self.injectionTestViewOpenInterface())
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

extension CoordinatorModifier {
    func injectionTestViewOpenInterface() -> TestViewOpenInterface {
        let interactor: TestViewInteractor = .init(coordinator: coordinator)
        let sceneModel: TestViewOpenInterface = TestViewSceneModel(interactor: interactor)
        
        return sceneModel
    }
    
}
