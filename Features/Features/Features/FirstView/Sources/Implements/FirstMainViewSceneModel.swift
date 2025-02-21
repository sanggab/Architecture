//
//  FirstMainViewSceneModel.swift
//  Features
//
//  Created by Gab on 2/21/25.
//

import SwiftUI

public protocol FirstViewCoordinatorFlowFeature {
    func pushSecond()
}

final class FirstMainViewSceneModel: ObservableObject {
    var coordiantorFlow: FirstViewCoordinatorFlowFeature?
    
//    init(coordiantorFlow: FirstViewCoordinatorFlowFeature) {
//        self.coordiantorFlow = coordiantorFlow
//    }
    
    func test() {
        coordiantorFlow?.pushSecond()
    }
}

final class FirstMainViewInteractor {
    
}
