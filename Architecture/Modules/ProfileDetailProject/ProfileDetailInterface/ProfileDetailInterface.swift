//
//  ProfileDetailInterface.swift
//  ProfileDetailInterface
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import Combine
import ProfileEditInterface

public protocol ProfileDetailCoordinatorInteface {
    func openProfileEdit(interface: any ProfileEditOutputInterface)
}

//enum TestCase: Hashable {
//    static func == (lhs: TestCase, rhs: TestCase) -> Bool {
//        switch (lhs, rhs) {
//        case (.hi(let publisher1), .hi(let publisher2)):
//            
//            return true
//        }
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        
//    }
//    
//    case hi(AnyPublisher<Int, Never>)
//}
