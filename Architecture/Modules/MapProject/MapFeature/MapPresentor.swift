//
//  MapPresentor.swift
//  MapFeature
//
//  Created by Gab on 2/24/25.
//

import SwiftUI
import Combine

import Domain
import MapInterface

public final class MapPresentor {
    let interactor: MapInteractor
    let coordinator: MapFlowCoordinatorInterface
    
    private var cancellable: Set<AnyCancellable> = []
    
    public init(useCase: UseCaseInterface, coordinator: MapFlowCoordinatorInterface) {
        self.interactor = MapInteractor(useCase: useCase)
        self.coordinator = coordinator
    }
    
    @MainActor
    func bindMapVieWModel(_ bindMapViewModel: AnyPublisher<Bool, Never>) {
        print("상갑 logEvent MapPresentor \(#function)")
        bindMapViewModel
            .sink { [weak self] state in
                guard let `self` = self else { return }
                
                Task {
                    let result = try await self.interactor.openLikesYouMapInteractor()
                    
                    if result {
                        self.coordinator.openLikesyouView()
                    }
                }
            }
            .store(in: &cancellable)
    }
}
