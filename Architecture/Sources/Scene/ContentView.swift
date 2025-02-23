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
                            Text("첫 번째 뷰 푸시")
                        }
                        .onTapGesture {
//                            coordinator.push(page: .first)
                        }
                    
                    Rectangle()
                        .fill(.blue)
                        .overlay {
                            Text("두 번째 뷰 푸시")
                        }
                        .onTapGesture {
//                            coordinator.push(page: .second)
                        }
                    
                    Rectangle()
                        .fill(.pink)
                        .overlay {
                            Text("세 번째 뷰 푸시")
                        }
                        .onTapGesture {
//                            coordinator.push(page: .third)
                        }
                }
                .frame(height: 50)
                
//                TabView {
//                    FirstMainView()
//                        .tag(0)
//                        .tabItem {
//                            Image(systemName: "moon.stars.fill")
//                            
//                            Text("첫 번째 뷰")
//                        }
//                    
//                    SecondMainView()
//                        .tag(1)
//                        .tabItem {
//                            Image(systemName: "cloud.moon.bolt.fill")
//                            
//                            Text("두 번째 뷰")
//                        }
//                    
//                    ThirdMainView()
//                        .tag(2)
//                        .tabItem {
//                            Image(systemName: "sun.snow.fill")
//                            
//                            Text("세 번째 뷰")
//                        }
//                }
            }
            .modifier(CoordinatorModifier())
            .environmentObject(coordinator)
        }
    }
}

#Preview {
    ContentView()
}
