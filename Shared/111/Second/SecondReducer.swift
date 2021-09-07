//
//  SecondReducer.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

// MARK: - Reducer
let secondReducer = Reducer<SecondState, SecondAction, SecondEnvironment> { state, action, environment in
    switch action {
    case let .changed(id):
//        if let index = state.stickerArray.firstIndex(where: { $0.id == id }) {
//            state.stickerArray[index].second1 = Int.random(length: 5)
//            state.stickerArray[index].second2 = String.random(length: 5)
//        }
        
        state.stickerArray[id]?.second1 = Int.random(length: 5)
        state.stickerArray[id]?.second2 = String.random(length: 5)
        
        
        
        return .none
    }
}

