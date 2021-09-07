//
//  ThirdState.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - State
struct ThirdState: Equatable {
    var foStickerModel: FOStickerModel
    var stickerArray: [UUID: FOStickerItemModel] = [:]
    var ref: [ThirdWrapper]
    
    init(stickerModel: FOStickerModel) {
        self.foStickerModel = stickerModel
        self.ref = stickerModel.stickerItemArray.map({ ThirdWrapper(id: $0.id, member1: $0.third1, member2: $0.third2)})
        
        stickerArray = stickerModel.stickerItemArray.reduce([UUID: FOStickerItemModel]()) { (dict, item) -> [UUID: FOStickerItemModel] in
            var dict = dict
            dict[item.id] = item
            return dict
        }
    }
}


struct ThirdWrapper: Equatable, Hashable {
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
