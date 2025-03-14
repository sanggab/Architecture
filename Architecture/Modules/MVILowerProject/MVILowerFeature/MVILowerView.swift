//
//  MVILowerView.swift
//  MVILowerFeature
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerInterface

public struct MVILowerView: View {
    
    @Binding private var ageState: Int
    
    public init(ageState: Binding<Int>) {
        self._ageState = ageState
    }
    
    public var body: some View {
        Text("MVILowerView")
        
        Button {
            let age: Int = (1...100).randomElement() ?? .zero
            self.ageState = age
        } label: {
            Text("랜덤 나이 발사한다")
        }
    }
}

//#Preview {
//    MVILowerView(interface: <#any MVILowerOutputInterface#>)
//}
