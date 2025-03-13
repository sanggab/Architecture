//
//  MVIParentView.swift
//  MVIProject
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerFeature

struct MVIParentView: View {
    @StateObject private var store: MVIParentStore = .init()
    
    var body: some View {
        Text("나이 : \(store(\.age))")
        
        MVILowerView(interface: store)
            .background(.mint)
    }
}

#Preview {
    MVIParentView()
}
