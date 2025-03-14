//
//  ProfileDetailView.swift
//  ProfileDetailFeature
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import Kingfisher

public struct ProfileDetailView: View {
    @StateObject private var store: ProfileDetailStore = .init()
    
    public var body: some View {
        Text("ProfileDetailView")
        
        KFImage(URL(string: store(\.profile.imgUrl)))
            .resizable()
            .frame(width: 300, height: 300)
        
        Text(store(\.profile.name))
            .font(.headline)
        
        Text(store(\.profile.age.description))
        
        
        Button {
            
        } label: {
            Text("ProfileEdit으로 이동해라")
        }

    }
}

#Preview {
    ProfileDetailView()
}
