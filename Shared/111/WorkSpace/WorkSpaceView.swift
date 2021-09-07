//
//  WorkSpaceView.swift
//  Test
//
//  Created by USER on 2021/08/26.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct WorkSpaceView: View {
    let store: Store<WorkSpaceState, WorkSpaceAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                VStack {
                    Text("WorkSpaceView")
                    Spacer()
                    Divider()

                    ForEach(viewStore.stickerModel.stickerItemArray) { item in
                        VStack(alignment: .center) {
                            Text("\(item.id)")
                            Text("first1: \(item.first1)")
                            Text("first2: \(item.first2)")
                            Text("second1: \(item.second1)")
                            Text("second2: \(item.second2)")
                            Text("third1: \(item.third1)")
                            Text("third2: \(item.third2)")
                        }
                        Divider()
                    }
                    Spacer()

                }
                List {
                    Section(header: Text("first")) {
                        FirstView(store: store.scope(state: \.first,
                                                     action: WorkSpaceAction.first))
                    }
                    Divider()
                    Section(header: Text("second")) {
                        SecondView(store: store.scope(state: \.second,
                                                      action: WorkSpaceAction.second))
                    }
                    Divider()
                    Section(header: Text("third")) {
                        ThirdView(store: store.scope(state: \.third,
                                                     action: WorkSpaceAction.third))
                    }
                }
            }
        }
    }
}
