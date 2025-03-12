//
//  MessageFeature.swift
//  MessageFeature
//
//  Created by Gab on 3/11/25.
//

import SwiftUI
import Combine

struct MessageFeatureView: View {
    @ObservedObject private var viewModel: MessageViewModel = .init()
    
    private let input: PassthroughSubject<MessageViewModel.Action, Never> = .init()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                input.send(.one)
            }
            .onAppear {
//                viewModel.bind(input.eraseToAnyPublisher())
            }
    }
}
#Preview {
    MessageFeatureView()
}
