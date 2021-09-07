//
//  ObjectState.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - State
struct ObjectState: Equatable {
    var toolbar: ObjectToolbarState = .init()
    
    var state: State = .list(.init())
    var list: ObjectListState = .init()
    
    var isList: Bool {
        switch self.state {
        case .renderOrder(_):
            return false
        case .list(_):
            return true
        }
    }
    
    enum State: Equatable {
        case renderOrder(ObjectRenderOrderState)
        case list(ObjectListState)
    }
    
    init(model: StickerModel = .init()) {
        state = .list(.init())
    }
}

struct StickerModel {
    
}

enum StickerItemAspectRatioType: String {
    case any
    case ratio16
    case ratio9
    
    func asString() -> String {
        self.rawValue
    }
}

enum StickerItemTriggerType: String {
    case face
    case faceDetect
    
    func asString() -> String {
        self.rawValue
    }
}
