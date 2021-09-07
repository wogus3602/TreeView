//
//  ContentView.swift
//  Shared
//
//  Created by USER on 2021/09/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var items: Item
    
    init(item: Item) {
        self.items = item
    }
    
    var body: some View {
        List {
            ForEachView(items: items)
        }
    }
}

struct ForEachView: View {
    @StateObject var items: Item
    
    var body: some View {
        ForEach(items.children) { item in
            LabelView(parent: items, item: item)
        }
    }
}

struct LabelView: View {
    @StateObject var parent: Item
    @StateObject var item: Item
    
    var body: some View {
        Group {
            if item.children.isEmpty {
                Text("\(item.title)")
                    .contextMenu {
                        Button("delete") {
                            if let index = parent.children.firstIndex(where: { $0.id == item.id }) {
                                parent.remove(at: index)
                            }
                        }
                    }
            } else {
                DisclosureGroup(
                    isExpanded: item.$isExpanded,
                    content: {
                        ForEachView(items: item)
                    },
                    label: {
                        Text("\(item.title)")
                            .contextMenu {
                                Button("delete") {
                                    if let index = parent.children.firstIndex(where: { $0.id == item.id }) {
                                        parent.remove(at: index)
                                    }
                                }
                            }
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let item: Item = dummyItems2
        ContentView(item: item)
    }
}

class Item: Identifiable, ObservableObject {
    var id: UUID = UUID()
    
    @Binding var isExpanded: Bool
    @Published var title: String = "title"
    @Published var children: [Item] = []
    
    init(title: String,
         children: [Item]) {
        self.title = title
        self.children = children
        self._isExpanded = .constant(true)
    }
    
    func remove(at index: Int) {
        children.remove(at: index)
    }
}

let dummyItems2 = Item(title: "root",
                       children: [
                        Item(title: "1",
                             children: [
                                Item(title: "1-1",
                                     children: [
                                        Item(title: "1-1-1",
                                             children: [])]
                                ),
                                Item(title: "1-2",
                                     children: [
                                        Item(title: "1-2-1",
                                             children: []),
                                        Item(title: "1-2-2",
                                             children: [])]
                                )
                             ]),
                        Item(title: "2",
                             children: [
                                Item(title: "2-1",
                                     children: [
                                        Item(title: "2-1-1",
                                             children: [])]
                                ),
                                Item(title: "2-2",
                                     children: [
                                        Item(title: "2-2-1",
                                             children: [])]
                                ),
                                Item(title: "2-3",
                                     children: [
                                        Item(title: "2-3-1",
                                             children: [])]
                                ),
                             ]),
                        Item(title: "3",
                             children: [
                                Item(title: "3-1",
                                     children: [
                                        Item(title: "3-1-1",
                                             children: []),
                                        Item(title: "3-1-2",
                                             children: []),
                                        Item(title: "3-1-3",
                                             children: [])]
                                ),
                                Item(title: "3-2",
                                     children: [
                                        Item(title: "3-1-1",
                                             children: [])]
                                ),
                                Item(title: "3-3",
                                     children: [
                                        Item(title: "3-1-1",
                                             children: [])]
                                )
                             ])
                        
                       ])
