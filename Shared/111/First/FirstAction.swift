//
//  FirstAction.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Action
enum FirstAction {
    case changed(UUID)
    case onMove(IndexSet, Int)
    case onDelete(UUID)
}
