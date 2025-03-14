//
//  MVIServiceView.swift
//  MVIService
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import MVIFeature
import MVILowerFeature

public struct MVIServiceView: View {
    
    @StateObject private var store: MVIServiceStore = .init()
    
    public init() { }
    
    public var body: some View {
        Text("MVIServiceView")
        
//        MVIParentView()
    }
}

#Preview {
    MVIServiceView()
}
