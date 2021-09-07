//
//  SecondState.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//// MARK: - State
//struct SecondState: Equatable {
//    var foStickerModel: FOStickerModel
//
//    var stickerArray: [FOStickerItemModel] {
//        foStickerModel.stickerItemArray
//    }
//
//    init(stickerModel: FOStickerModel) {
//        self.foStickerModel = stickerModel
//    }
//}
//


// MARK: - State
struct SecondState: Equatable {
    var foStickerModel: FOStickerModel

    var stickerArray: [UUID: FOStickerItemModel] = [:]
    var ref: [SecondWrapper]

    init(stickerModel: FOStickerModel) {
        self.foStickerModel = stickerModel
        self.ref = stickerModel.stickerItemArray.map({ SecondWrapper(id: $0.id, member1: $0.second1, member2: $0.second2)})

        stickerArray = stickerModel.stickerItemArray.reduce([UUID: FOStickerItemModel]()) { (dict, item) -> [UUID: FOStickerItemModel] in
            var dict = dict
            dict[item.id] = item
            return dict
        }
    }
}

struct SecondWrapper: Equatable, Hashable, Identifiable {
   var id: UUID
   var title: String
   var member1: Int
   var member2: String

   init(
       id: UUID,
       title: String = "",
       member1: Int,
       member2: String
   ) {
       self.id = id
       self.title = title
       self.member1 = member1
       self.member2 = member2
   }
}
