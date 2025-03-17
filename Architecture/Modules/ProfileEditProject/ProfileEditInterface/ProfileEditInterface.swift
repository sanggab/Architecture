//
//  ProfileEditInterface.swift
//  ProfileEditInterface
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import Combine

import Core

public protocol ProfileEditOutputInterface: Hashable {
    func deliverModel(model: ProfileModel)
}

public struct ProfileEditOutputModel: Identifiable, Hashable {
    public static func == (lhs: ProfileEditOutputModel, rhs: ProfileEditOutputModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public typealias ID = String
    
    public let id: String
    
    public let interface: any ProfileEditOutputInterface
    
    public init(id: String = UUID().uuidString, interface: any ProfileEditOutputInterface) {
        self.id = id
        self.interface = interface
    }
}




enum TestCase: Hashable {
    static func == (lhs: TestCase, rhs: TestCase) -> Bool {
        switch (lhs, rhs) {
        case (.hi2(let subject1), .hi2(let subject2)):
            return subject1.value == subject2.value
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .hi2(let subject):
            hasher.combine(subject.value)
        }
    }
    
    case hi2(CurrentValueSubject<Int, Never>)
}
