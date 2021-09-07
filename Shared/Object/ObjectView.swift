//
//  ObjectView.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ObjectView: View {
    let store: Store<ObjectState, ObjectAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Button(viewStore.isList ? "Render Order" : "List" ) {
                    viewStore.send(.viewChange)
                }
                ObjectToolbarView(store: store.scope(
                    state: \.toolbar,
                    action: ObjectAction.toolbar
                ))
                ObjectListView(store: store.scope(
                    state: \.list,
                    action: ObjectAction.list
                ))
//                SwitchStore(self.store.scope(state: \.state)) {
//                    CaseLet(state: /ObjectState.State.list,
//                            action: ObjectAction.list) { store in
//                        ObjectListView(store: store)
//                    }
//
//                    CaseLet(state: /ObjectState.State.renderOrder,
//                            action: ObjectAction.renderOrder) { store in
//                        ObjectRenderOrderView(store: store)
//                    }
//                }
            }
        }
    }
}
