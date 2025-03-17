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
