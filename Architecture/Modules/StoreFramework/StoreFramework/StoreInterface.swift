//
//  StoreInterface.swift
//  StoreFramework
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import Combine

public protocol StoreInterface: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}
