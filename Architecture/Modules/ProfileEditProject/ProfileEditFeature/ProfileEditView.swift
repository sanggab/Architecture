//
//  ProfileEditView.swift
//  ProfileEditFeature
//
//  Created by Gab on 3/14/25.
//

import SwiftUI
import Kingfisher

public struct ProfileEditView: View {
    @StateObject private var store: ProfileEditStore = .init()
    
    public var body: some View {
        KFImage(URL(string: store(\.profile.imgUrl)))
            .resizable()
            .frame(width: 300, height: 300)
        
        Text(store(\.profile.name))
            .font(.headline)
        
        Text(store(\.profile.age.description))
        
        Button {
            let url: String = [
                "https://blog.kakaocdn.net/dn/bc7cmf/btrokpKKQUS/K656VyWoFsasEd0FxwXTu0/img.png",
                "https://upload3.inven.co.kr/upload/2023/11/21/bbs/i16506236397.png",
                "https://upload3.inven.co.kr/upload/2023/03/12/bbs/i13108690323.jpg",
                "https://upload3.inven.co.kr/upload/2023/09/24/bbs/i16195278416.jpg",
                "https://upload3.inven.co.kr/upload/2023/11/21/bbs/i17226991301.png"
            ].randomElement() ?? "https://pbs.twimg.com/media/FG4GQ_vaAAQwHy5.jpg"
            
            store.action(.updateImage(url))
        } label: {
            Text("이미지 바껴랏")
        }
        
        Button {
            let name: String = [
                "주훈",
                "은진",
                "수빈",
                "병은",
                "진우",
                "기은",
                "근영",
                "연학",
            ].randomElement() ?? "상갑"
            
            store.action(.updateName(name))
        } label: {
            Text("이름 바껴랏")
        }
        
        Button {
            let age: Int = (1...100).randomElement() ?? 30
            
            store.action(.updateAge(age))
        } label: {
            Text("나이 바껴랏")
        }

        Button {
            let model = store(\.profile)
        } label: {
            Text("ProfileDetail에 바뀐 프로필 전달해라")
        }
    }
}

#Preview {
    ProfileEditView()
}
