//
//  FirstView.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: Store<FirstState, FirstAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                ForEach(viewStore.ref, id: \.self) { item in
                    Text("\(item.title)")
                    Text("first1 -- \(item.member1)")
                    Text("first2 -- \(item.member2)")
                    
                    Button("\(item.id) Tapped") {
                        viewStore.send(.changed(item.id))
                    }
                }
                
                Divider()
                ForEach(Array(viewStore.stickerArray.values)) { item in
                    HStack {
                        VStack {
                            Text("second1 -- \(item.second1)")
                            Text("second2 -- \(item.second2)")
                            
                            Text("third1 -- \(item.third1)")
                            Text("third2 -- \(item.third2)")
                        }
                        Button("Delete"){
                            viewStore.send(.onDelete(item.id))
                        }
                    }
                }
                
            }
        }
    }
}
