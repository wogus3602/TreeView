import ComposableArchitecture

typealias ItemReducer = Reducer<Item, ItemAction, ItemEnvironment>

let itemReducer = ItemReducer.recurse { `self` in
    .init { state, action, environment in
        switch action {
        case .node:
            if case let .node(id, action: .delete) = action {
                state.children.remove(id: id)
                return .none
            }
            
            return self.forEach(
                state: \.children,
                action: /ItemAction.node(id:action:),
                environment: { $0 }
            )
            .run(&state, action, environment)
            
        case let .disclosureTapped(isExpanded):
            state.isExpanded = isExpanded
            return .none
            
        case .delete:
            return .none
        }
    }
}

extension Reducer {
    static func recurse(_ reducer: @escaping (Reducer) -> Reducer) -> Reducer {
        var `self`: Reducer!
        self = Reducer { state, action, environment in
            reducer(self).run(&state, action, environment)
        }
        return self
    }
}
