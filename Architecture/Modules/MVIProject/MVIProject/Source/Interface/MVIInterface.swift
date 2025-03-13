//
//  MVIInterface.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI

protocol MVIStoreAction: Equatable {
    associatedtype ViewAction
    associatedtype UpdateAction
}

protocol ViewModelFeatures: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}
