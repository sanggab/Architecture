//
//  ViewModel.swift
//  MVVMProject
//
//  Created by Gab on 3/12/25.
//

import SwiftUI
import Combine

enum TestCase {
    case create
    case read
    case update
    case delete
}

final class ViewModel {
    
    struct Input {
        var one: PassthroughSubject<String, Never> = .init()
        var two: PassthroughSubject<Bool, Never> = .init()
        var three: CurrentValueSubject<Int, Never> = .init(30)
        var four: PassthroughSubject<TestCase, Never> = .init()
    }
    
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
