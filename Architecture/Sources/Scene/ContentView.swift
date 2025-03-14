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
        NavigationStack(path: coordinator.navigationPathBinding2) {
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(.mint)
                        .overlay {
                            Text("첫 번째 뷰 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .map)
                        }
                    
                    Rectangle()
                        .fill(.blue)
                        .overlay {
                            Text("두 번째 뷰 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .likesyou)
                        }
                    
                    Rectangle()
                        .fill(.pink)
                        .overlay {
                            Text("세 번째 뷰 푸시")
                        }
                        .onTapGesture {
                            coordinator.push(page: .test)
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
