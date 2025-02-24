//
//  MapFeature.swift
//  MapFeature
//
//  Created by 심상갑 on 2/23/25.
//

import SwiftUI

import MapInterface

public struct MapFeatureView: View {
    
    @ObservedObject private var viewModel: MapViewModel = .init()
    private var presentor: MapPresentor
    
    public init(presentor: MapPresentor) {
        self.presentor = presentor
    }
    
    public var body: some View {
        Group {
            Text("MapFeature")
            
            Button {
                viewModel.openLikesYou()
            } label: {
                Text("Open Likes you")
            }
        }
        .task {
            self.presentor.bindMapVieWModel(viewModel.getMapViewModelCommunication())
        }

    }
}

//#Preview {
//    MapFeature(coordinator: )
//}
