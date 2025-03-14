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
    func openMVILower(ageState: Binding<Int>)
}

public protocol ViewModelFeatures: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

public struct MVIProjectPageItem: Identifiable, Hashable {
    public static func == (lhs: MVIProjectPageItem, rhs: MVIProjectPageItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.state.wrappedValue == rhs.state.wrappedValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(state.wrappedValue)
    }
    
    public let id = UUID()
    public let state: Binding<Int>
    
    public init(state: Binding<Int>) {
        self.state = state
    }
}
