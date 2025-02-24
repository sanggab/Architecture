//
//  MapInteractor.swift
//  MapFeature
//
//  Created by Gab on 2/24/25.
//

import SwiftUI
import Domain

final class MapInteractor {
    
    let useCase: UseCaseInterface
    
    init(useCase: UseCaseInterface) {
        self.useCase = useCase
    }
    
    func openLikesYouMapInteractor() async throws -> Bool {
        print("상갑 logEvent MapInteractor \(#function)")
        return try await self.useCase.openLikesYouUseCaseInterface()
    }
}
