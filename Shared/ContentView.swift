import SwiftUI

struct FileItem: Identifiable {
    let name: String
    var children: [FileItem]?

    var id: String { name }

    static let spmData: [FileItem] = [
        FileItem(name: ".gitignore"),
        FileItem(name: "Package.swift"),
        FileItem(name: "README.md"),
        FileItem(name: "Sources", children: [
            FileItem(name: "fivestars", children: [
                FileItem(name: "main.swift")
            ]),
        ]),
        FileItem(name: "Tests", children: [
            FileItem(name: "fivestarsTests", children: [
                FileItem(name: "fivestarsTests.swift"),
                FileItem(name: "XCTestManifests.swift"),
            ]),
            FileItem(name: "LinuxMain.swift")
        ])
    ]
}

class ViewModel: ObservableObject {
    @Published var data: [FileItem] = [
        FileItem(name: "1", children: [
            FileItem(name: "1-1", children: [
                FileItem(name: "1-1-1")
            ]),
            FileItem(name: "1-2", children: [
                FileItem(name: "1-2-1"),
                FileItem(name: "1-2-2")
            ])
        ]),
        FileItem(name: "2", children: [
            FileItem(name: "2-1", children: [
                FileItem(name: "2-1-1")
            ]),
            FileItem(name: "2-2", children: [
                FileItem(name: "2-2-1")
            ]),
            FileItem(name: "2-3", children: [
                FileItem(name: "2-3-1")
            ])
        ]),
        FileItem(name: "2"),
        FileItem(name: "3"),
        FileItem(name: "4", children: [
            FileItem(name: "4-1", children: [
                FileItem(name: "4-1-1")
            ]),
        ]),
        FileItem(name: "5", children: [
            FileItem(name: "5-1", children: [
                FileItem(name: "5-1-1"),
                FileItem(name: "5-1-2"),
            ]),
            FileItem(name: "5-2")
        ])
    ]

    func remove1() {
        data[0].children?[0].children = nil
    }
    func remove2() {
        data[0].children?[1].children?.remove(at: 0)

    }

}

struct ContentView: View {

    @StateObject var viewModel = ViewModel()
    var body: some View {
        //    List(data, children: \.children, rowContent: { Text($0.name) })
        VStack {
            HierarchyList(data: viewModel.data, children: \.children, rowContent: { Text($0.name) })
            Button("remove1") {
                viewModel.remove1()
            }
            Button("remove1") {
                viewModel.remove2()
            }
        }
    }
}

public struct HierarchyList<Data, RowContent>: View where Data: RandomAccessCollection, Data.Element: Identifiable, RowContent: View {
    private let recursiveView: RecursiveView<Data, RowContent>

    public init(data: Data, children: KeyPath<Data.Element, Data?>, rowContent: @escaping (Data.Element) -> RowContent) {
        self.recursiveView = RecursiveView(data: data, children: children, rowContent: rowContent)
    }

    public var body: some View {
        List {
            recursiveView
        }
        .listStyle(SidebarListStyle())
    }
}

private struct RecursiveView<Data, RowContent>: View where Data: RandomAccessCollection, Data.Element: Identifiable, RowContent: View {
    let data: Data
    let children: KeyPath<Data.Element, Data?>
    let rowContent: (Data.Element) -> RowContent

    var body: some View {
        ForEach(data) { child in
            if let subChildren = child[keyPath: children] {
                DisclosureGroup(isExpanded: .constant(true), content: {
                    RecursiveView(data: subChildren, children: children, rowContent: rowContent)
                }, label: {
                    rowContent(child)
                })
            } else {
                rowContent(child)
            }
        }
    }
}


