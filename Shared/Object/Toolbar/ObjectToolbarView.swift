//
//  ObjectToolbarView.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ObjectToolbarView: View {
    let store: Store<ObjectToolbarState, ObjectToolbarAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Text("ObjectToolbarView")
        }
    }
}
