//
//  MVIParentView.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerInterface
import MVIInterface

public struct MVIParentView: View {
    @StateObject private var store: MVIParentStore = .init()
    
    private let coordinator: MVICoordinatorInteface
    
    public init(coordinator: MVICoordinatorInteface) {
        self.coordinator = coordinator
    }
    
    public var body: some View {
        Text("MVIParentView 나이 : \(store(\.age))")
        
        Button {
            let binding: Binding<Int> = .init {
                return self.store(\.age)
            } set: { value in
                self.store.action(.age(value))
            }

            coordinator.openMVILower(ageState: binding)
        } label: {
            Text("MVILowerProject로 이동해")
        }

    }
}

//#Preview {
//    MVIParentView()
//}
