////
////  ItemModel.swift
////  Test
////
////  Created by USER on 2021/09/03.
////
//
//import SwiftUI
//import Combine
//
//class ItemModel: ObservableObject {
//    var id: UUID = UUID()
//    var title: String = "title"
//    
//    @State var isExpanded: Bool
//    @Published private(set) var children: [UUID: ItemModel] = [:]
//
//    init(title: String,
//         items: [ItemModel]) {
//        self.title = title
//        self.isExpanded = true
//
//        items.forEach { child in
//            let item = child
//            self.children[item.id] = item
//        }
//        
//        
//    }
//
//    func remove(id: UUID) {
//        if let item = children[id] {
//            children.removeValue(forKey: item.id)
//        }
//    }
//}
