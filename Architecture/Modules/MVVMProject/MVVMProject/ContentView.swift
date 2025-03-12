//
//  ContentView.swift
//  MVVMProject
//
//  Created by Gab on 3/12/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    var viewModel: ViewModel
    
    @State private var oneText: String = ""
    @State private var twoText: String = ""
    @State private var threeText: String = ""
    
    @State private var cancellable: Set<AnyCancellable> = .init()
    
    init() {
        self.viewModel = .init()
    }
    
    var body: some View {
        VStack {
            Text("바인딩 테스트")
            
            HStack {
                Text("oneOutput")
                    .onTapGesture {
                        let randomText: String = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "카", "타", "파", "하"].randomElement() ?? ""
                        viewModel.input.one.send(randomText)
                    }
                
                Text(oneText)
                    .font(.headline)
                    .foregroundStyle(.pink)
            }
            
            HStack {
                Text("twoOutput")
                    .onTapGesture {
                        viewModel.input.two.send(.random())
                    }
                
                Text(twoText)
                    .font(.headline)
                    .foregroundStyle(.blue)
            }
            
            HStack {
                Text("threeOutput")
                    .onTapGesture {
                        viewModel.input.three.send((1...1000).randomElement() ?? 777)
                    }
                
                Text(threeText)
                    .font(.headline)
                    .foregroundStyle(.mint)
            }
        }
        .task {
            bind()
            viewModel.bind()
        }
    }
    
    func bind() {
        viewModel.output._oneOutput
            .sink { output in
                print("상갑 logEvent \(#function) viewModel.output._oneOutput: \(output)")
                oneText = output
            }
            .store(in: &cancellable)
        
        viewModel.output._twoOutput
            .sink { output in
                print("상갑 logEvent \(#function) viewModel.output._oneOutput: \(output)")
                twoText = output.description
            }
            .store(in: &cancellable)

        
        viewModel.output._threeOutput
            .sink { output in
                print("상갑 logEvent \(#function) viewModel.output._threeOutput: \(output)")
                threeText = String(output)
            }
            .store(in: &cancellable)
    }
}

#Preview {
    ContentView()
}
