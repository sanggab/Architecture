//
//  UseCaseImplements.swift
//  Domain
//
//  Created by Gab on 2/24/25.
//

import Foundation

public final class UseCaseImplements: UseCaseInterface {
    
    public init() { }
    
    public func openLikesYouUseCaseInterface() async throws -> Bool {
        print("상갑 logEvent UseCaseImplements \(#function)")
        return .random()
    }
}

public final class MyPageUseCaseImplements: MyPageUseCaseInterface {
    
    public init() { }
    
    public func openLikesYouUseCaseInterface() async throws -> Bool {
        print("상갑 logEvent MyPageUseCaseImplements \(#function)")
        return .random()
    }
}
