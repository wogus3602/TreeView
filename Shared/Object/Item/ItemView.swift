import SwiftUI
import ComposableArchitecture

struct ItemView: View {
    let store: Store<Item, ItemAction>
    
    var body: some View {
        ForEachStore(
            store.scope(
                state: \.children,
                action: ItemAction.node(id:action:)
            )
        ) { childStore in
            WithViewStore(childStore) { viewStore in
                if viewStore.children.isEmpty {
                    Text("\(viewStore.title)")
                        .contextMenu {
                            Button("delete") {
                                viewStore.send(.delete)
                            }
                        }
                } else {
                    DisclosureGroup(
                        isExpanded: viewStore.binding(
                            get: \.isExpanded,
                            send: ItemAction.disclosureTapped
                        ),
                        content: {
                            ItemView(store: childStore)
                        },
                        label: {
                            Text("\(viewStore.title)")
                                .contextMenu {
                                    Button("delete") {
                                        viewStore.send(.delete)
                                    }
                                }
                        }
                    )
                }
            }
        }
    }
}
