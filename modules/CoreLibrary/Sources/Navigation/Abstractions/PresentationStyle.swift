import Foundation
import UIKit

public protocol PresentationStyle {}

public struct PushPresentationStyle: PresentationStyle {
    let animated: Bool

    public init(animated: Bool = true) {
        self.animated = animated
    }
}

public struct PresentPresentationStyle: PresentationStyle {
    let animated: Bool
    let completion: (() -> Void)?

    public init(
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        self.animated = animated
        self.completion = completion
    }
}
