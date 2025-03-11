//
//  MyPageViewModel.swift
//  MyPageProject
//
//  Created by Gab on 3/11/25.
//

import SwiftUI
import Combine

protocol ViewModelFeatures {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

public class MyPageViewModel: ObservableObject, ViewModelFeatures {
    struct State: Equatable {
        init() { }
        
        var text: String = "초기값"
    }
    
    enum Action: Equatable {
        case updateText(String)
    }
    
    @Published private var state: State = .init()
    
    public init() { }
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .updateText(let string):
            self.update(\.text, newValue: string)
            print("상갑 logEvent \(#function) text: \(self(\.text))")
        }
    }
}

extension MyPageViewModel {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V: Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
