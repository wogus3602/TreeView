//
//  ObjectRenderOrderView.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ObjectRenderOrderView: View {
    let store: Store<ObjectRenderOrderState, ObjectRenderOrderAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Text("ObjectRenderOrderView")
        }
    }
}
