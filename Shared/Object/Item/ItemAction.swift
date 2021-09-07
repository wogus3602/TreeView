
import SwiftUI

// MARK: - Action
indirect enum ItemAction {
    case node(id: Item.ID, action: ItemAction)
    case disclosureTapped(Bool)
    case delete
}
