//
//  MapFeature.swift
//  MapFeature
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI
import MapInterface

public struct MapFeatureView: View {
    @ObservedObject private var sceneModel: MapSceneModel
    
    public init(coordinator: MapFlowCoordinatorInterface) {
        self.sceneModel = MapSceneModel(coordinator: coordinator)
    }
    
    public var body: some View {
        Text("MapFeature")
        
        Button {
            self.sceneModel.openLikesyou()
        } label: {
            Text("Open Likes you")
        }

    }
}

//#Preview {
//    MapFeature(coordinator: )
//}
