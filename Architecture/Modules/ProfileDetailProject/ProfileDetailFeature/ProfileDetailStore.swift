//
//  ProfileDetailStore.swift
//  ProfileDetailFeature
//
//  Created by Gab on 3/14/25.
//

import SwiftUI

import Core
import StoreFramework

import ProfileEditInterface

final class ProfileDetailStore: StoreInterface {
    static func == (lhs: ProfileDetailStore, rhs: ProfileDetailStore) -> Bool {
        lhs.state == rhs.state
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(state)
    }
    
    struct State: Hashable {
        var profile: ProfileModel = .empty
    }
    
    enum Action: Hashable {
        case updateProfile(ProfileModel)
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Hashable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
        case .updateProfile(let model):
            state.profile = model
        }
    }
    
    deinit {
        print("ProfileDetailStore \(#function)")
    }
}

extension ProfileDetailStore: ProfileEditOutputInterface {
    func deliverModel(model: ProfileModel) {
        print("\(#function) model: \(model)")
        self.action(.updateProfile(model))
    }
}

extension ProfileDetailStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Hashable {
        self.state[keyPath: keyPath] = newValue
    }
}
