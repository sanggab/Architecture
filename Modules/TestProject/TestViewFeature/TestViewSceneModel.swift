//
//  TestViewSceneModel.swift
//  TestViewFeature
//
//  Created by 심상갑 on 2/24/25.
//

import SwiftUI
import Combine
import TestViewInterface


final public class TestViewSceneModel: ObservableObject, TestViewOpenInterface {
    let interactor: TestViewInteractor
    
    public init(interactor: TestViewInteractor) {
        self.interactor = interactor
    }
    
    public func test() {
        interactor.coordinator.removeAllNavigationViews()
    }
    

}
