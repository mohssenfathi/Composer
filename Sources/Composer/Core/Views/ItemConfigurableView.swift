
import UIKit

public protocol ItemConfigurableView {
    associatedtype Item
    @discardableResult func configure(with item: Item) -> Self
}
