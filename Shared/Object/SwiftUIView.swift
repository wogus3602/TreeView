//
//  SwiftUIView.swift
//  Test (iOS)
//
//  Created by USER on 2021/08/27.
//
import ComposableArchitecture
import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ObjectView(store: Store<ObjectState, ObjectAction>(
            initialState: ObjectState(),
            reducer: objectReducer,
            environment: ObjectEnvironment()
        )
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
