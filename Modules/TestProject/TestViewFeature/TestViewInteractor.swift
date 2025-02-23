//
//  TestViewInteractor.swift
//  TestViewFeature
//
//  Created by 심상갑 on 2/24/25.
//

import SwiftUI
import TestViewInterface

final public class TestViewInteractor {
    let coordinator: TestviewFlowCoordinatorInteface
    
    public init(coordinator: TestviewFlowCoordinatorInteface) {
        self.coordinator = coordinator
    }
}
