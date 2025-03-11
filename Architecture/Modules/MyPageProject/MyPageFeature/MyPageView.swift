//
//  MyPageView.swift
//  MyPageProject
//
//  Created by Gab on 3/11/25.
//

import SwiftUI

public struct MyPageView: View {
    
    private let presenter: MyPagePresenter
    
    @StateObject private var viewModel: MyPageViewModel = .init()
    
    public init(presenter: MyPagePresenter) {
        print("상갑 logEvent MyPageView \(#function)")
        self.presenter = presenter
    }
    
    public var body: some View {
        MyPageSubView()
            .moveAction {
                presenter.move()
            }
            .touchAction {
                presenter.changeText()
            }
            .task {
                presenter.bind(to: viewModel)
            }
            .environmentObject(viewModel)
    }
}

//#Preview {
//    MyPageView(presenter: )
//}
