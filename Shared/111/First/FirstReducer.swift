//
//  FirstReducer.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import ComposableArchitecture

// MARK: - Reducer
let firstReducer = Reducer<FirstState, FirstAction, FirstEnvironment> { state, action, environment in
    switch action {
    case let .changed(id):
        state.ref[
        state.stickerArray[id]?.first1 = Int.random(length: 5)
        state.stickerArray[id]?.first2 = String.random(length: 5)
        
        return .none
        
    case let .onMove(indexSet, newOffset):
        state.foStickerModel.stickerItemArray.move(fromOffsets: indexSet, toOffset: newOffset)
        return .none
        
    case let .onDelete(id):
        if let sticker = state.stickerArray[id],
           let index = state.foStickerModel.stickerItemArray.firstIndex(of: sticker) {
            
            state.foStickerModel.stickerItemArray.remove(at: index)
        }
        return .none
    }
}
