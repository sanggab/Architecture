//
//  Coordinator.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import Combine

import MapInterface
import TestViewInterface
import MyPageInterface
import MVIInterface
import MVILowerInterface
import ProfileDetailInterface
import ProfileEditInterface

enum Page: Hashable {
//    static func == (lhs: Page, rhs: Page) -> Bool {
//        switch (lhs, rhs) {
//        case (.map, .map):
//            return true
//        case (.likesyou, .likesyou):
//            return true
//        case (.messageList, .messageList):
//            return true
//        case (.message, .message):
//            return true
//        case (.mypage, .mypage):
//            return true
//        case (.test, .test):
//            return true
//        case (.mviproject, .mviproject):
//            return true
//        case (.mvilowerproject(_, let test1), .mvilowerproject(_, let test2)):
//            
//            return test1 == test2
//        default:
//            return true
//        }
//    }
//    
    case map
    case likesyou
    case messageList
    case message
    case mypage
    case test
    case mviproject
    case mvilowerproject(item: MVIProjectPageItem)
    case profileDetail
    case profileEdit(item: ProfileEditOutputModel)
}



protocol CoordinatorFlowFeatures: ObservableObject {
    func push(page: Page)
    func pop(page: Page)
    func popToRoot()
}



final class Coordinator: CoordinatorFlowFeatures {
    @Published private var navigationViews: [Page] = []
    @Published private var navigationPath: NavigationPath = .init()

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
    
    var navigationPathBinding2: Binding<NavigationPath> {
        Binding {
            return self.navigationPath
        } set: { newValue in
            self.navigationPath = newValue
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

extension Coordinator: MVICoordinatorInteface {
    func openMVILower(ageState: Binding<Int>) {
        self.navigationViews.append(.mvilowerproject(item: .init(state: ageState)))
    }
}

extension Coordinator: ProfileDetailCoordinatorInteface {
    func openProfileEdit(interface: any ProfileEditOutputInterface) {
        let item: ProfileEditOutputModel = .init(id: UUID().uuidString, interface: interface)
        self.navigationViews.append(.profileEdit(item: item))
    }
}

final class MapFlowCoordinator: MapFlowCoordinatorInterface {
    func openLikesyouView() {
        print("상갑 logEvent MapFlowCoordinator\(#function)")
    }
}
