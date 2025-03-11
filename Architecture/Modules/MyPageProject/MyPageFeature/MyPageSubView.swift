//
//  MyPageSubView.swift
//  MyPageProject
//
//  Created by Gab on 3/11/25.
//

import SwiftUI

struct MyPageSubView: View {
    
    @EnvironmentObject private var viewModel: MyPageViewModel
    
    var moveAction: (() -> Void)?
    var touchAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(viewModel(\.text))
                .font(.headline)
                .foregroundStyle(.black)
            
            Rectangle()
                .fill(.pink)
                .frame(width: 300, height: 300)
                .overlay {
                    HStack {
                        Button {
                            moveAction?()
                        } label: {
                            Text("MyPageSubView 무브 액션")
                        }
                        .background(.blue.opacity(0.5))
                        .foregroundStyle(.black)
                        
                        Button {
                            touchAction?()
                        } label: {
                            Text("MyPageSubView 터치 액션")
                        }
                        .background(.blue.opacity(0.5))
                        .foregroundStyle(.black)
                    }
                }
        }
    }
}

extension MyPageSubView {
    func moveAction(_ action: @escaping (() -> Void)) -> MyPageSubView {
        var view: MyPageSubView = self
        view.moveAction = action
        return view
    }
    
    func touchAction(_ action: @escaping (() -> Void)) -> MyPageSubView {
        var view: MyPageSubView = self
        view.touchAction = action
        return view
    }
}

#Preview {
    MyPageSubView()
}
