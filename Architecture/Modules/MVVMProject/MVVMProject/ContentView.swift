//
//  ContentView.swift
//  MVVMProject
//
//  Created by Gab on 3/12/25.
//

import SwiftUI
import Combine

/// SwiftUI에서 MVVM 구조가 필요한가에 대한 나의 생각
/// MVVM의 ViewModel은 데이터를 바인딩해주고 비즈니스 로직을 처리하고 View에 보여줄 데이터를 가공하는 역할.
/// 하지만 SwiftUI에서는 Property Wrapper라는 데이터 바인딩을 해주는 어노테이션이 존재하는 데, VM의 왜 필요할까라고 생각이 들게 됨
/// 그래서 SwiftUI에서 VM을 구현해보기로함.
/// 구현한 결과, SwiftUI 강점인 Property Wrapper, Modifier를 사용을 못 함.
/// State의 업데이트를 위해서 Property Wrapper을 제공해줬는데 단순하게 oneText를 업데이트를 하면 되는 것을 바인딩을 거쳐서 업데이트해줌.
/// 그래서 내가 SwiftUI에서 MVVM은 안 맞는다고 생각하는 이유.
///
/// 내가 생각한 결론:
/// 결국 SwiftUI에서는 Data Binding이라는 애는 @State같은 Property Wrapper들이 해주고, View는 Body의 영역이 해주고 비즈니스 로직은 func를 만들어서 처리할거니까 이 제차게 MVVM 구조가 아닌가라고 생각이 든다.
struct ContentView: View {
    
    /// VM
    var viewModel: ViewModel
    
    /// SwiftUI 같은 선언형 UI는 명령형 UI와 달리 UI의 상태 변화를 직접 알려줄 필요가 없음
    /// 하지만 MVVM 구조로 가져간다면 Output을 바인딩해서 UI에 알려줘야 할 의무가 있음
    /// 그래서 Output하고 바인딩할 객체를 만듬.
    /// 하지만 Struct이기 때문에 어노테이션이 없는 객체들을 만들기 힘듬.
    /// 그래서 @State 객체를 만듬.
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
            /// VM과 V에서 객체들을 바인딩 시켜줌.
            bind()
            viewModel.bind()
        }
    }
    
    /// VM의 Output을 바인딩을 해주는 메소드
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
