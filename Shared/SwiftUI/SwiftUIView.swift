////
////  SwiftUIView.swift
////  Test
////
////  Created by USER on 2021/09/03.
////
//
//import SwiftUI
//
//struct ItemView2: View {
//    var item: ItemModel
//    
//    var body: some View {
//        ForEach([item.children.values]) { child in
//            if child.children.isEmpty {
//                Text("\(child.title)")
//                    .contextMenu {
//                        Button("delete") {
////                            item.remove(id: child.id)
//                        }
//                    }
//            } else {
//                DisclosureGroup(
//                    isExpanded: child.$isExpanded,
//                    content: {
//                        ItemView2(item: child)
//                    },
//                    label: {
//                        Text("\(child.title)")
//                            .contextMenu {
//                                Button("delete") {
////                                    item.remove(id: child.id)
//                                }
//                            }
//                    }
//                )
//            }
//        }
//    }
//}
//
////struct NodeView: View {
////    @ObservedObject var node: Node
////
////    var body: some View {
////        TextField("X", text: self.$node.xString)
////    }
////}
////
////class Node: ObservableObject, Identifiable {
////    @Published var xString: String
////    let id: String = UUID().uuidString
////
////    init(xString: String) {
////        self.xString = xString
////    }
////}
//
////ForEachStore(
////    store.scope(
////        state: \.children,
////        action: ItemAction.node(id:action:)
////    )
////) { childStore in
////    WithViewStore(childStore) { viewStore in
////        if viewStore.children.isEmpty {
////            Text("\(viewStore.title)")
////                .contextMenu {
////                    Button("delete") {
////                        viewStore.send(.delete)
////                    }
////                }
////        } else {
////            DisclosureGroup(
////                isExpanded: viewStore.binding(
////                    get: \.isExpanded,
////                    send: ItemAction.disclosureTapped
////                ),
////                content: {
////                    ItemView(store: childStore)
////                },
////                label: {
////                    Text("\(viewStore.title)")
////                        .contextMenu {
////                            Button("delete") {
////                                viewStore.send(.delete)
////                            }
////                        }
////                }
////            )
////        }
////    }
////}
