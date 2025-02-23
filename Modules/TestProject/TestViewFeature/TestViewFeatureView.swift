//
//  TestViewFeatureView.swift
//  TestViewFeature
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI
import TestViewInterface

public struct TestViewFeatureView: View {
    let sceneModel: TestViewOpenInterface
    
    public init(sceneModel: TestViewOpenInterface) {
        self.sceneModel = sceneModel
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                sceneModel.test()
            }
    }
}

