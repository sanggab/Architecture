//
//  MapViewModel.swift
//  MapFeature
//
//  Created by Gab on 2/24/25.
//

import SwiftUI
import Combine

final class MapViewModel: ObservableObject {
    
    let mapViewModelCommunication: PassthroughSubject<Bool, Never> = .init()
    
    func openLikesYou() {
        print("상갑 logEvent openLikesYou \(#function)")
        mapViewModelCommunication.send(true)
    }
}


extension MapViewModel {
    
    func getMapViewModelCommunication() -> AnyPublisher<Bool, Never> {
        return mapViewModelCommunication.eraseToAnyPublisher()
    }
}
