//
//  WorkSpaceReducer.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

// MARK: - Reducer
let workSpaceReducer = Reducer<WorkSpaceState, WorkSpaceAction, WorkSpaceEnvironment>
.combine(
    firstReducer.pullback(state: \.first,
                          action: /WorkSpaceAction.first,
                          environment: { _ in FirstEnvironment()}),
    secondReducer.pullback(state: \.second,
                          action: /WorkSpaceAction.second,
                          environment: { _ in SecondEnvironment()}),
    thirdReducer.pullback(state: \.third,
                          action: /WorkSpaceAction.third,
                          environment: { _ in ThirdEnvironment()}),
   Reducer { state, action, environment in
        switch action {
        case .first:
            
            state.stickerModel.stickerItemArray
//            state.first = FirstState(stickerModel: state.stickerModel)

            return .init(value: .refresh)
            
        case .second(_):
//            state.second = SecondState(stickerModel: state.stickerModel)
            return .init(value: .refresh)

        case .third(_):
//            state.third = ThirdState(stickerModel: state.stickerModel)

            return .init(value: .refresh)

        case .refresh:
            state.first = FirstState(stickerModel: state.stickerModel)
            state.second = SecondState(stickerModel: state.stickerModel)
            state.third = ThirdState(stickerModel: state.stickerModel)
            return .none

        }
    }
)
