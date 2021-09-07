////
////  ItemTest.swift
////  Test
////
////  Created by USER on 2021/09/06.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @ObservedObject var items: Item
//    
//    init(item: Item) {
//        self.items = item
//    }
//    
//    var body: some View {
//        List {
//            ForEachView(items: items)
//        }
//        .listStyle(SidebarListStyle())
//    }
//}
//
//struct ForEachView: View {
//    @StateObject var items: Item
//    
//    var body: some View {
//        ForEach(items.children) { item in
//            LabelView(parent: items, item: item)
//        }
//    }
//}
//
//struct LabelView: View {
//    @ObservedObject var parent: Item
//    @ObservedObject var item: Item
//    
//    var body: some View {
//        Group {
//            DisclosureGroup(
//                isExpanded: item.$isExpanded,
//                content: {
//                    ForEach(item.children) { child in
//                        if !child.children.isEmpty {
//                            LabelView(parent: item, item: child)
//                        } else {
//                            Text("\(child.title)")
//                                .contextMenu {
//                                    Button("delete") {
//                                        if let index = item.children.firstIndex(where: { $0.id == child.id }) {
//                                            item.remove(at: index)
//                                        }
//                                    }
//                                }
//                        }
//                    }
//                },
//                label: {
//                    Text("\(item.title)")
//                        .contextMenu {
//                            Button("delete") {
//                                if let index = parent.children.firstIndex(where: { $0.id == item.id }) {
//                                    parent.remove(at: index)
//                                }
//                            }
//                        }
//                }
//            )
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let item: Item = dummyItems2
//        ContentView(item: item)
//    }
//}
//
//class Item: Identifiable, ObservableObject, Equatable {
//    static func == (lhs: Item, rhs: Item) -> Bool {
//        lhs.id == rhs.id
//            && lhs.isExpanded == rhs.isExpanded
//            && lhs.title == rhs.title
//            && lhs.children == rhs.children
//    }
//    
//    var id: UUID = UUID()
//    
//    @Binding var isExpanded: Bool
//    @Published var title: String = "title"
//    @Published var children: [Item] = []
//    
//    init(title: String,
//         children: [Item]) {
//        self.title = title
//        self.children = children
//        self._isExpanded = .constant(true)
//    }
//    
//    func remove(at index: Int) {
//        children.remove(at: index)
//    }
//}
//
//let dummyItems2 = Item(title: "root",
//                             children: [
//                                Item(title: "1",
//                                     children: [
//                                        Item(title: "1-1",
//                                             children: [
//                                                Item(title: "1-1-1",
//                                                     children: [])]
//                                        ),
//                                        Item(title: "1-2",
//                                             children: [
//                                                Item(title: "1-2-1",
//                                                     children: []),
//                                                Item(title: "1-2-2",
//                                                     children: [])]
//                                        )
//                                     ]),
//                                Item(title: "2",
//                                     children: [
//                                        Item(title: "2-1",
//                                             children: [
//                                                Item(title: "2-1-1",
//                                                     children: [])]
//                                        ),
//                                        Item(title: "2-2",
//                                             children: [
//                                                Item(title: "2-2-1",
//                                                     children: [])]
//                                        ),
//                                        Item(title: "2-3",
//                                             children: [
//                                                Item(title: "2-3-1",
//                                                     children: [])]
//                                        ),
//                                     ]),
//                                Item(title: "3",
//                                     children: [
//                                        Item(title: "3-1",
//                                             children: [
//                                                Item(title: "3-1-1",
//                                                     children: []),
//                                                Item(title: "3-1-2",
//                                                     children: []),
//                                                Item(title: "3-1-3",
//                                                     children: [])]
//                                        ),
//                                        Item(title: "3-2",
//                                             children: [
//                                                Item(title: "3-1-1",
//                                                     children: [])]
//                                        ),
//                                        Item(title: "3-3",
//                                             children: [
//                                                Item(title: "3-1-1",
//                                                     children: [])]
//                                        )
//                                     ])
//                                
//                             ])
//
//
//struct ForEachOrEmpty<Data, ID, ForEachContent, EmptyContent>: View where Data: RandomAccessCollection, ID: Hashable, ForEachContent: View, EmptyContent: View {
//  let data: Data
//  let forEachBuilder: (Data.Element) -> ForEachContent
//  let emptyBuilder: () -> EmptyContent
//  let identityKeyPath: KeyPath<Data.Element, ID>
//  
//  init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder each: @escaping (Data.Element)->ForEachContent, @ViewBuilder empty: @escaping () -> EmptyContent) {
//    self.data = data
//    identityKeyPath = id
//    forEachBuilder = each
//    emptyBuilder = empty
//  }
//  
//  
//  var body: some View {
//    if data.isEmpty {
//      return AnyView(emptyBuilder())
//    } else {
//      return AnyView(ForEach(data, id: identityKeyPath, content: forEachBuilder))
//    }
//  }
//}
//
//
//
//extension ForEachOrEmpty where ID == Data.Element.ID, Data.Element: Identifiable {
//  init(_ data: Data, @ViewBuilder each: @escaping (Data.Element)->ForEachContent, @ViewBuilder empty: @escaping () -> EmptyContent) {
//    self.init(data, id: \.id , each: each, empty: empty)
//  }
//}
