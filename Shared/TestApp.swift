////
////  TestApp.swift
////  Shared
////
////  Created by USER on 2021/08/26.
////
//
import SwiftUI
//
////@main
////struct TestApp: App {
////
////    var body: some Scene {
////        WindowGroup {
////           ContentView()
////        }
////    }
////}
//
//
@main
struct TestApp: App {
    var item: Item = dummyItems2
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView(item: item)
            }
        }
    }
}
//
//class Player: ObservableObject {
//    var name: String
//    @Published var tokens: [Token] = [
//        Token(name: "Goblin", amount: 3),
//        Token(name: "Spirit", amount: 3),
//        Token(name: "Beast", amount: 3),
//        Token(name: "Angel", amount: 3),
//        Token(name: "Demon", amount: 3),
//        Token(name: "Bird", amount: 3),
//        Token(name: "Dragon", amount: 3)
//    ]
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Token: Identifiable, ObservableObject {
//    let id = UUID()
//    let name: String
//    @Published var amount: Int
//    init(name: String, amount: Int) {
//        self.name = name
//        self.amount = amount
//    }
//}
//
////struct ForEachView: View {
////    @StateObject var player: Player
////    var body: some View {
////        VStack {
////            List {
////                ForEach(player.tokens) { token in
////                    TokenView(player: player, token: token)
////                }
////            }
////            Button("Delete first") {
////                if !player.tokens.isEmpty {
////                    player.tokens.remove(at: 0)
////                }
////            }
////        }
////    }
////}
//
//struct TokenView: View {
//    @ObservedObject var player: Player
//    @ObservedObject var token: Token
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text("Name: \(token.name)")
//                Text("Amount: \(token.amount)")
//            }
//            Spacer()
//            Button("Decrease") {
//                if token.amount > 1 {
//                    token.amount -= 1
//                } else {
//                    let index = player.tokens.firstIndex { item in
//                        item.id == token.id
//                    }
//                    if let index = index {
//                        player.tokens.remove(at: index)
//                    }
//                }
//            }
//        }
//    }
//}
