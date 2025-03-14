//
//  MVIServiceStore.swift
//  MVIService
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import MVIInterface

public class MVIServiceStore: ViewModelFeatures {
    public struct State: Equatable {
        public init() { }
        var age: Int = .zero
    }
    
    public enum Action: Equatable {
        case setAge(Int)
    }
    
    @Published private var state: State = .init()
    
    public func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return self.state[keyPath: keyPath]
    }
    
    public func action(_ action: Action) {
        switch action {
        case .setAge:
            print("상갑 logEvent \(#function) getAge")
        }
    }
}

extension MVIServiceStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
