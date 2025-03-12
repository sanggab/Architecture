//
//  MessageViewModel.swift
//  MessageFeature
//
//  Created by Gab on 3/12/25.
//

import SwiftUI
import Combine

protocol ViewModelFeatures {
    associatedtype State: Equatable
    associatedtype Action
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

final class MessageViewModel: ObservableObject, ViewModelFeatures {
    struct State: Equatable {
        var main: Int = 0
    }
    
    enum Action {
        case one
    }
    
    @Published private var state: State = .init()

    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return self.state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .one:
            print("one")
        }
    }
}
