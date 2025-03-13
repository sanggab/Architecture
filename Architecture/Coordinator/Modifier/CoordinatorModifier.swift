//
//  CoordinatorModifier.swift
//  Architecture
//
//  Created by Gab on 2/20/25.
//

import SwiftUI
import MapFeature
import LikesyouFeature
import TestViewFeature
import TestViewInterface
import MyPageFeature
import Domain

struct CoordinatorModifier: ViewModifier {
    @EnvironmentObject private var coordinator: Coordinator
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Page.self) { page in
                switch page {
                case .map:
                    MapFeatureView(presentor: self.getMapPresentor())
                case .likesyou:
                    LikesyouFeatureView()
                case .test:
                    TestViewFeatureView(sceneModel: self.injectionTestViewOpenInterface())
                case .mypage:
                    MyPageView(presenter: getMyPagePresenter())
                default:
                    EmptyView()
                }
            }
    }
}

extension CoordinatorModifier {
    func getMapPresentor() -> MapPresentor {
        return MapPresentor(useCase: getUseCaseInterface(),
                            coordinator: coordinator)
    }
    
    func getUseCaseInterface() -> UseCaseInterface {
        return UseCaseImplements()
    }
}

extension CoordinatorModifier {
    func injectionTestViewOpenInterface() -> TestViewOpenInterface {
        let interactor: TestViewInteractor = .init(coordinator: coordinator)
        let sceneModel: TestViewOpenInterface = TestViewSceneModel(interactor: interactor)
        
        return sceneModel
    }
}

extension CoordinatorModifier {
    func getMyPagePresenter() -> MyPagePresenter {
        return MyPagePresenter(useCase: getMyPageUseCaseInterface(),
                               coordinator: coordinator)
    }
    
    func getMyPageViewModel() -> MyPageViewModel {
        return MyPageViewModel()
    }
    
    func getMyPageUseCaseInterface() -> MyPageUseCaseInterface {
        return MyPageUseCaseImplements()
    }
}
