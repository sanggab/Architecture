//
//  TestViewInterface.swift
//  TestViewInterface
//
//  Created by 심상갑 on 2/23/25.
//

import Foundation

public protocol TestViewOpenInterface {
    func test()
}

public protocol TestviewFlowCoordinatorInteface {
    func removeAllNavigationViews()
}

final public class MockingTestViewFlowCoordinator: TestviewFlowCoordinatorInteface {
    public init() {}
    
    public func removeAllNavigationViews() {
        
    }
}
