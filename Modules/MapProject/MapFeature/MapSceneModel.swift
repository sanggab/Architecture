//
//  MapSceneModel.swift
//  MapFeature
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI
import MapInterface

final class MapSceneModel: ObservableObject {
    let viewModel: MapOpenInterface
    
    init(coordinator: MapFlowCoordinatorInterface) {
        self.viewModel = MapViewModel(coordinator: coordinator)
    }
    
    func openLikesyou() {
        self.viewModel.openLikesyouAction()
    }
}
