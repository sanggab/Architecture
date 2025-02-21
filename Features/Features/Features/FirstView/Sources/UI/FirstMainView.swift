//
//  FirstMainView.swift
//  Features
//
//  Created by Gab on 2/20/25.
//

import SwiftUI

// MARK: 
public struct FirstMainView: View {
    @ObservedObject private var sceneModel: FirstMainViewSceneModel = .init()
    
    public init(coordinator: FirstViewCoordinatorFlowFeature? = nil) {
        self.sceneModel.coordiantorFlow = coordinator
    }
    
    public var body: some View {
        Text("FirstMainView")
            .onTapGesture {
                self.sceneModel.test()
            }
    }
}

#Preview {
    FirstMainView()
}
