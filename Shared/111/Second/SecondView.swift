//
//  SecondView.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    let store: Store<SecondState, SecondAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(viewStore.ref, id: \.self) { item in
                    Text("second")
                    Text("second1 -- \(item.member1)")
                    Text("second2 -- \(item.member2)")
                        
                    Button("\(item.id)  Tapped") {
                        viewStore.send(.changed(item.id))
                    }
                }
                
                Divider()
                
                ForEach(viewStore.foStickerModel.stickerItemArray) { item in
                    Text("first2 -- \(item.first1)")
                    Text("first2 -- \(item.first2)")
                      
                    Text("third1 -- \(item.third1)")
                    Text("third2 -- \(item.third2)")
                }
            }
        }
    }
}
