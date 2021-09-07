import ComposableArchitecture

struct Item: Identifiable, Equatable {
    var id: UUID = UUID()

    var isExpanded: Bool
    var title: String = "title"
    var children: IdentifiedArrayOf<Item> = []

    init(title: String,
         children: IdentifiedArrayOf<Item>) {
        self.title = title
        self.children = children
        self.isExpanded = true
    }
}
