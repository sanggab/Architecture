//
//  Coordinator.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI

enum Page: Equatable {
    case map
    case likesyou
    case messageList
    case message
}

protocol CoordinatorFlowFeatures: ObservableObject {
    func push(page: Page)
    func pop(page: Page)
    func popToRoot()
}



final class Coordinator: CoordinatorFlowFeatures {
    @Published private var navigationViews: [Page] = []
    
    var mapViewCoordinatorInterface: MapViewFlowCoordinatorInterface = MapViewCoordinator()
    
    init() {
        self.mapViewCoordinatorInterface = self
    }
    
    var navigationPathBinding: Binding<[Page]> {
        Binding {
            return self.navigationViews
        } set: { newValue in
            self.navigationViews =  newValue
        }
    }
    
    func push(page: Page) {
        print("상갑 logEvent \(#function) page: \(page)")
        self.navigationViews.append(page)
    }
    
    func pop(page: Page) {
        print("상갑 logEvent \(#function) page: \(page)")
        self.navigationViews.removeAll(where: { $0 == page })
    }
    
    func popToRoot() {
        print("상갑 logEvent \(#function)")
        self.navigationViews.removeAll()
    }
}
