//
//  ProfileModel.swift
//  Core
//
//  Created by Gab on 3/14/25.
//

import UIKit

public struct ProfileModel: Identifiable, Hashable {
    public typealias ID = String
    
    public static let empty: ProfileModel = .init(age: 30,
                                                  name: "심상갑",
                                                  imgUrl: "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fccammn%2Fbtru5sfGNW7%2F5WfgUPICf6g8R1MDcpWESK%2Fimg.png")
    
    public var id: ID
    
    public var age: Int
    public var name: String
    public var imgUrl: String
    
    public init(id: ID = UUID().uuidString, age: Int, name: String, imgUrl: String) {
        self.id = id
        self.age = age
        self.name = name
        self.imgUrl = imgUrl
    }
}
