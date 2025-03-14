//
//  ProfileDetailStore.swift
//  ProfileDetailFeature
//
//  Created by Gab on 3/14/25.
//

import SwiftUI

import Core
import StoreFramework

final class ProfileDetailStore: StoreInterface {
    struct State: Equatable {
        var profile: ProfileModel = .empty
    }
    
    enum Action: Equatable {
        case updateProfile(ProfileModel)
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .updateProfile(let model):
            state.profile = model
        }
    }
}

extension ProfileDetailStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
