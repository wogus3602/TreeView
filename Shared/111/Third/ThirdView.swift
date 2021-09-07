//
//  ThirdView.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ThirdView: View {
    let store: Store<ThirdState, ThirdAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(Array(viewStore.ref), id: \.self) { item in
                    Text("\(item.title)")
                    Text("third1 -- \(item.member1)")
                    Text("third2 -- \(item.member2)")
                        
                    Button("\(item.id) Tapped") {
                        viewStore.send(.changed(item.id))
                    }
                }
                
                Divider()
                
                ForEach(viewStore.foStickerModel.stickerItemArray) { item in
                    Text("first1 -- \(item.first1)")
                    Text("first2 -- \(item.first2)")
                    
                    Text("second1 -- \(item.second1)")
                    Text("second2 -- \(item.second2)")  
                }
            }
        }
    }
}
