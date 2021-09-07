////
////  WorkSpaceState.swift
////  Test
////
////  Created by USER on 2021/08/26.
////  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
////
//
//import SwiftUI
//
//// MARK: - State
//struct WorkSpaceState: Equatable {
//    
////    var first: FirstState {
////        get {
////            FirstState(ref: .init(title: "first",
////                                  member1: self.ref.ref.member1,
////                                  member2: self.ref.ref.member2))
////        }
////
////        set {
////            self.ref.ref.member1 = newValue.ref.member1
////            self.ref.ref.member2 = newValue.ref.member2
////        }
////    }
////
////    var second: SecondState {
////        get {
////            SecondState(ref: .init(title: "second",
////                                   member1: self.ref.ref.member1,
////                                   member2: self.ref.ref.member2))
////        }
////
////        set {
////            self.ref.ref.member1 = newValue.ref.member1
////            self.ref.ref.member2 = newValue.ref.member2
////        }
////    }
////
////    var third: ThirdState {
////        get {
////            ThirdState(ref: .init(title: "third",
////                                  member1: self.ref.ref.member1,
////                                  member2: self.ref.ref.member2))
////        }
////
////        set {
////            self.ref.ref.member1 = newValue.ref.member1
////            self.ref.ref.member2 = newValue.ref.member2
////        }
////    }
//    
//    var first: FirstState
//    var second: SecondState
//    var third: ThirdState
//    
////    var ref: Reference2
//    
//    init(_ ref: Reference) {
////        self.ref = .init(ref: ref)
//        self.first = .init(ref: .init(title: "first", ref: ref))
//        self.second = .init(ref: .init(title: "second", ref: ref))
//        self.third = .init(ref: .init(title: "third", ref: ref))
//
//    }
//}
//
//struct ReferenceWrapper: Equatable {
//    var title: String
//    var member1: Int
//    var member2: String
//    
//}
//
//class Reference2: Equatable, ObservableObject {
//    static func == (lhs: Reference2, rhs: Reference2) -> Bool {
//        lhs.ref == rhs.ref
//    }
//    
//    @Published var ref: Reference
//    var title: String
//    
//    var member1: Int {
//        get {
//            ref.member1
//        }
//        
//        set {
//            ref.member1 = newValue
//        }
//    }
//    
//    var member2: String {
//        get {
//            ref.member2
//        }
//        
//        set {
//            ref.member2 = newValue
//        }
//    }
//    
//    init(title: String, ref: Reference) {
//        self.title = title
//        self.ref = ref
//        print(ref.member1)
//        print(ref.member2)
//    }
//}
//
//class Reference: Equatable {
//    var id = UUID()
//    var member1: Int = 0 {
//        didSet {
//            print("change \(member1)")
//        }
//    }
//    var member2 = "1"
//    
//    static func == (lhs: Reference, rhs: Reference) -> Bool {
//        lhs.id == rhs.id &&
//            lhs.member1 == rhs.member1 &&
//            lhs.member2 == rhs.member2
//    }
//}
