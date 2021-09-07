 //
 //  WorkSpaceState.swift
 //  Test
 //
 //  Created by USER on 2021/08/26.
 //  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
 //
 
 import SwiftUI
 
 // MARK: - State
 struct WorkSpaceState: Equatable {
    
    // Object
    var first: FirstState
    
    //Preview
    var second: SecondState
    
    //Inspector
    var third: ThirdState
    
    var stickerModel: FOStickerModel
    
    init(_ ref: FOStickerModel) {
        self.stickerModel = ref
        
        self.first = FirstState(stickerModel: ref)
        self.second = SecondState(stickerModel: ref)
        self.third = ThirdState(stickerModel: ref)
    }
 } 
 
 class FOStickerModel: Equatable {
    static func == (lhs: FOStickerModel, rhs: FOStickerModel) -> Bool {
        lhs.stickerItemArray == rhs.stickerItemArray
    }
    
    var stickerItemArray: [FOStickerItemModel]

    init(_ arr: [FOStickerItemModel] = []) {
        stickerItemArray = arr
    }
 }
 
 class FOStickerItemModel: Equatable, Identifiable {
    var id = UUID()
    
    var first1: Int = 0
    var first2 = "1"
    
    var second1 = 2
    var second2 = "2"
    
    var third1 = 3
    var third2 = "3"
    
    static func == (lhs: FOStickerItemModel, rhs: FOStickerItemModel) -> Bool {
        lhs.id == rhs.id
//       && lhs.first1 == rhs.first1
//            && lhs.first2 == rhs.first2
//            && lhs.second1 == rhs.second1
//            && lhs.second2 == rhs.second2
//            && lhs.third1 == rhs.third1
//            && lhs.third2 == rhs.third2
//
        
    }
 }
