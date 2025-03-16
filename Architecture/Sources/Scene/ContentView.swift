//
//  ContentView.swift
//  Architecture
//
//  Created by Gab on 2/18/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator: Coordinator = .init()
    
    var body: some View {
        NavigationStack(path: coordinator.navigationPathBinding) {
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(.mint)
                        .overlay {
                            Text("Map 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .map)
                        }
                    
                    Rectangle()
                        .fill(.blue)
                        .overlay {
                            Text("Likeyou 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .likesyou)
                        }
                    
                    Rectangle()
                        .fill(.pink)
                        .overlay {
                            Text("ProfileDetail 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .profileDetail)
                        }
                    
                    Rectangle()
                        .fill(.orange)
                        .overlay {
                            Text("MVIProject 뷰 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .mviproject)
                        }
                }
                .frame(height: 50)
            }
            .modifier(CoordinatorModifier())
            .environmentObject(coordinator)
        }
    }
}

#Preview {
    ContentView()
}
