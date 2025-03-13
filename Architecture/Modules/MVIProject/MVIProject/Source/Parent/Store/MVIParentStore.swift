//
//  MVIParentStore.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerInterface

final class MVIParentStore: ViewModelFeatures {
    
    struct State: Equatable {
        var age: Int = 30
        var money: Int = 100000
    }
    
    enum Action: Equatable {
        case buy
        case wash
        case child(MVIParentStore.ChildAction)
        case age(Int)
    }
    
    struct ChildState: Equatable {
        var age: Int = 2
        var fullness: Bool = false
    }
    
    enum ChildAction: Equatable {
        case cry
        case eat
    }
    
    
    @Published var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return self.state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .buy:
            let discount: Int = ((1000...5000).randomElement() ?? 3000)
            self.update(\.money, newValue: 100000 - discount)
        case .wash:
            print("상갑 logEvent \(#function) wash")
        case .age(let age):
            self.update(\.age, newValue: age)
        case .child(let childAction):
            switch childAction {
            case .cry:
                print("상갑 logEvent \(#function) cry")
            case .eat:
                print("상갑 logEvent \(#function) eat")
            }
        }
    }
}

extension MVIParentStore: MVILowerOutputInterface {
    func getAge(age: Int) {
        print("상갑 logEvent \(#function) age: \(age)")
        self.action(.age(age))
    }
}

extension MVIParentStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V: Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
