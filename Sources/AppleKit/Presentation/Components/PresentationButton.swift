import Foundation
import SwiftUI

public struct PresentationButton {
    public let title: LocalizedStringKey
    public let action: () -> Void
    
    public init(title: LocalizedStringKey, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
}
