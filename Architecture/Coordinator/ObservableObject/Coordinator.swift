//
//  Coordinator.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import MapInterface
import TestViewInterface
import MyPageInterface

enum Page: Equatable {
    case map
    case likesyou
    case messageList
    case message
    case mypage
    case test
}

protocol CoordinatorFlowFeatures: ObservableObject {
    func push(page: Page)
    func pop(page: Page)
    func popToRoot()
}



final class Coordinator: CoordinatorFlowFeatures {
    @Published private var navigationViews: [Page] = []
    
    var mapViewCoordinatorInterface: MapFlowCoordinatorInterface = MapFlowCoordinator()
    
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

extension Coordinator: MapFlowCoordinatorInterface {
    func openLikesyouView() {
//        self.navigationViews.append(.likesyou)
        self.navigationViews.append(.mypage)
    }
}

extension Coordinator: TestviewFlowCoordinatorInteface {
    func removeAllNavigationViews() {
        print(#function)
        self.navigationViews.removeAll()
    }
}

extension Coordinator: MyPageCoordinatorInteface {
    func openLikesyouViewOfMypage() {
        print("상갑 logEvent \(#function)")
        self.navigationViews.append(.likesyou)
    }
}

final class MapFlowCoordinator: MapFlowCoordinatorInterface {
    func openLikesyouView() {
        print("상갑 logEvent MapFlowCoordinator\(#function)")
    }
}
