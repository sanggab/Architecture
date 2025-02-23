//
//  MapViewModel.swift
//  MapFeature
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI
import MapInterface


final class MapViewModel {
    private var coordinator: MapFlowCoordinatorInterface
    
    init(coordinator: MapFlowCoordinatorInterface) {
        self.coordinator = coordinator
    }
}

extension MapViewModel: MapOpenInterface {
    func openLikesyouAction() {
        self.coordinator.openLikesyouView()
    }
}
