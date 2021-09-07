//
//  ObjectAction.swift
//  Test
//
//  Created by USER on 2021/08/27.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Action
enum ObjectAction: Equatable {
    case toolbar(ObjectToolbarAction)
    
    case list(ObjectListAction)
    case renderOrder(ObjectRenderOrderAction)
    
    case viewChange
}
