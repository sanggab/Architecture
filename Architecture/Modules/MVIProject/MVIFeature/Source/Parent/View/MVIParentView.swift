//
//  MVIParentView.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerInterface

public struct MVIParentView: View {
    @StateObject private var store: MVIParentStore = .init()
    
    public init() {
        
    }
    
    public var body: some View {
        Text("MVIParentView 나이 : \(store(\.age))")
    }
}

//#Preview {
//    MVIParentView()
//}
