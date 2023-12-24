import Foundation
import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach(addSubview)
    }
}

extension UIStackView {
    func addArrangedSubviews(_ view: UIView...) {
        view.forEach(addArrangedSubview)
    }
}
