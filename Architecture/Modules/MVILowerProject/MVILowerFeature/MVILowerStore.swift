//
//  MVILowerStore.swift
//  MVILowerFeature
//
//  Created by Gab on 3/13/25.
//

import SwiftUI

protocol ViewModelFeatures: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

final class MVILowerStore: ViewModelFeatures {
    
    struct State: Equatable {
        var age: Int = 30
    }
    
    enum Action: Equatable {
        case setAge(Int)
    }
    
    @Published var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return self.state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .setAge(let age):
            self.update(\.age, newValue: age)
        }
    }
}

extension MVILowerStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V: Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
