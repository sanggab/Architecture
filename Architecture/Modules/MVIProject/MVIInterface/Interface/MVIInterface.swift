//
//  MVIInterface.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import Combine
import MVILowerInterface

protocol MVIStoreAction: Equatable {
    associatedtype ViewAction
    associatedtype UpdateAction
}

public protocol MVICoordinatorInteface {
    func openMVILower(publisher: MVILowerOutputInterface)
}

public protocol ViewModelFeatures: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}
