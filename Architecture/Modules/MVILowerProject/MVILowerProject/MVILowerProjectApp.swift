//
//  MVILowerProjectApp.swift
//  MVILowerProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerFeature

@main
struct MVILowerProjectApp: App {
    var body: some Scene {
        WindowGroup {
            MVILowerView(ageState: .constant(5))
        }
    }
}
