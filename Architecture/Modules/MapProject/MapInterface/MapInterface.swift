//
//  MapInterface.swift
//  MapInterface
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI

public protocol MapOpenInterface {
    func openLikesyouAction()
}

public protocol MapFlowCoordinatorInterface {
    func openLikesyouView()
}

final public class MockingMapFlowCoordinator: MapFlowCoordinatorInterface {
    
    public init() {
        
    }
    
    public func openLikesyouView() {
        print(#function)
    }
}
