//
//import SwiftUI
//
//struct ContentView: View {
//    
//    var body: some View {
//        List {
//            ItemView(store:
//                        .init(initialState: item,
//                              reducer: itemReducer,
//                              environment: ItemEnvironment()))
//        }
//        .listStyle(SidebarListStyle())
//    }
//}
//
//let item = Item(title: "root",
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
