//
//  ProfileEditStore.swift
//  ProfileEditFeature
//
//  Created by Gab on 3/14/25.
//

import SwiftUI

import Core
import StoreFramework

final class ProfileEditStore: StoreInterface {
    struct State: Hashable {
        var profile: ProfileModel = .empty
    }
    
    enum Action: Hashable {
//        case updateProfile(ProfileModel)
        case updateImage(String)
        case updateAge(Int)
        case updateName(String)
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        switch action {
//        case .updateProfile(let model):
//            state.profile = model
        case .updateImage(let url):
            self.update(\.profile.imgUrl, newValue: url)
        case .updateAge(let age):
            self.update(\.profile.age, newValue: age)
        case .updateName(let name):
            self.update(\.profile.name, newValue: name)
        }
    }
    
    deinit {
        print("ProfileEditStore \(#function)")
    }

}

extension ProfileEditStore {
    func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        self.state[keyPath: keyPath] = newValue
    }
}
