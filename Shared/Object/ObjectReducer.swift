//
//  ObjectReducer.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

// MARK: - Reducer
let objectReducer = Reducer<ObjectState, ObjectAction, ObjectEnvironment>.combine(
    objectListReducer
        .pullback(
            state: \.list,
            action: /ObjectAction.list,
            environment: { _ in
                .init()
            }),
    .init { state, action, environment in
        switch action {
        case .viewChange:
            state.state = state.isList ? .renderOrder(.init()) : .list(.init())
            return .none
        }
    }
)

