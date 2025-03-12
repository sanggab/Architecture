//
//  ViewModel.swift
//  MVVMProject
//
//  Created by Gab on 3/12/25.
//

import SwiftUI
import Combine

/// VM의 Input을 인터페이스화 시키면 Action하고 다를 바 없음
/// 그러면 ``ViewModel/Output-swift.struct``은 결국엔 State가 되버림
/// 즉 MVI 구조가 되버린다.
protocol ViewModelInputInterface {
    func one()
    func two()
    func three()
    func four()
}

enum TestCase {
    case create
    case read
    case update
    case delete
}
/// VM
///
final class ViewModel {
    /// View의 Input 모델
    /// Input 모델을 인터페이스로 만들면 안되는 이유 ``ViewModelInputInterface``
    struct Input {
        var one: PassthroughSubject<String, Never> = .init()
        var two: PassthroughSubject<Bool, Never> = .init()
        var three: CurrentValueSubject<Int, Never> = .init(30)
        var four: PassthroughSubject<TestCase, Never> = .init()
    }
    
//    enum Input2 {
//        case one
//        case two
//        case three
//        case four
//    }
    
    /// View의 Output 모델
    struct Output {
        var _oneOutput: PassthroughSubject<String, Never> = .init()
        var _twoOutput: PassthroughSubject<Bool, Never> = .init()
        var _threeOutput: PassthroughSubject<Int, Never> = .init()
    }
    
    var input: Input = .init()
    var output: Output = .init()
    
    var cancellable: Set<AnyCancellable> = .init()
    
    init() {
        
    }
    /// Input모델과 Output모델을 연결
    func bind() {
        let test: PassthroughSubject<TestCase, Never> = input.four
        
        test.sink { `case` in
            switch `case` {
            case .create:
                print("create")
            case .read:
                print("read")
            case .update:
                print("update")
            case .delete:
                print("delete")
            }
        }.store(in: &cancellable)
        
        input.one
            .sink { [weak self] string in
                guard let `self` = self else { return }
                print("상갑 logEvent \(#function) input.one")
                self.output._oneOutput.send(string)
            }
            .store(in: &cancellable)
        
        input.two
            .sink { [weak self] state in
                guard let `self` = self else { return }
                print("상갑 logEvent \(#function) input.two")
                self.output._twoOutput.send(state)
            }
            .store(in: &cancellable)
        
        input.three
            .sink { [weak self] value in
                guard let `self` = self else { return }
                print("상갑 logEvent \(#function) input.three")
                self.output._threeOutput.send(value)
            }
            .store(in: &cancellable)
    }
}

extension ViewModel: ViewModelInputInterface {
    func one() {
        self.output._oneOutput.send("원이다")
    }
    
    func two() {
        self.output._oneOutput.send("둘이다")
    }
    
    func three() {
        self.output._oneOutput.send("셋이다")
    }
    
    func four() {
        self.output._oneOutput.send("원이다")
    }
}
