//
//  ContentView.swift
//  Shared
//
//  Created by USER on 2021/08/26.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let foStickerModel = FOStickerModel([
        FOStickerItemModel(),
        FOStickerItemModel()
    ])
    
    var body: some View {
        WorkSpaceView(store:
                        Store(initialState: WorkSpaceState(foStickerModel),
                              reducer: workSpaceReducer,
                              environment: WorkSpaceEnvironment())
        )
    }
}

extension String {
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
}

extension Int {
    static func random(length: Int = 20) -> Int {
        let base = "1234567890"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return Int(randomString) ?? 0
    }}
