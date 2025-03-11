//
//  MyPagePresenter.swift
//  MyPageProject
//
//  Created by Gab on 3/11/25.
//

import SwiftUI
import Combine

import Domain
import MyPageInterface


public class MyPagePresenter {
    
    private let useCase: MyPageUseCaseInterface
    private let coordinator: MyPageCoordinatorInteface
    private var viewModel: MyPageViewModel?
    
    public init(useCase: MyPageUseCaseInterface,
                coordinator: MyPageCoordinatorInteface) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    @MainActor
    public func move() {
        Task {
            let response: Bool = try await self.useCase.openLikesYouUseCaseInterface()
            response ? self.coordinator.openLikesyouViewOfMypage() : nil
        }
    }
    
    public func changeText() {
        let text: String = ["안녕", "녕안", "제로백", "백로제"].randomElement() ?? "이건머야"
        viewModel?.action(.updateText(text))
    }
    
    func bind(to viewModel: MyPageViewModel) {
        self.viewModel = viewModel
    }
}

//extension MyPagePresenter {
//    func getViewModel() -> MyPageViewModel {
//        return self.viewModel
//    }
//}
