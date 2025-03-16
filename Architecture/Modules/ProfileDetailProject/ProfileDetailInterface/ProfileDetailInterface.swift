//
//  ProfileDetailInterface.swift
//  ProfileDetailInterface
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import ProfileEditInterface

public protocol ProfileDetailCoordinatorInteface {
    func openProfileEdit(interface: any ProfileEditOutputInterface)
}
