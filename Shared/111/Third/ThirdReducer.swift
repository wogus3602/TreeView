//
//  ThirdReducer.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

// MARK: - Reducer
let thirdReducer = Reducer<ThirdState, ThirdAction, ThirdEnvironment> { state, action, environment in
    switch action {
    case let .changed(id):
        
        state.stickerArray[id]?.third1 = Int.random(length: 5)
        state.stickerArray[id]?.third2 = String.random(length: 5)
        
        return .none
    }
}
