//
//  MVILowerView.swift
//  MVILowerFeature
//
//  Created by Gab on 3/13/25.
//

import SwiftUI
import MVILowerInterface

public struct MVILowerView: View {
    
    private var interface: MVILowerOutputInterface
    
    public init(interface: MVILowerOutputInterface) {
        self.interface = interface
    }
    
    public var body: some View {
        Text("MVILowerView")
        
        Button {
            let age: Int = (1...100).randomElement() ?? .zero
            interface.getAge(age: age)
        } label: {
            Text("랜덤 나이 발사한다")
        }
    }
}

//#Preview {
//    MVILowerView(interface: <#any MVILowerOutputInterface#>)
//}
