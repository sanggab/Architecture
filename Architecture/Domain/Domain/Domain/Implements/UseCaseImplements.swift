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
