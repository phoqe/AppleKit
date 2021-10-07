#if os(iOS)
import SwiftUI

/**
 A stylized SF Symbol that appears in apps by Apple, e.g., Find My and Maps.
 You can use it in multiple environments but more specifically as a close button in a Sheet.

 - Requires: The symbol is only available on the iOS platform.
 - Remark: The SF Symbol in use is `xmark.circle.fill`.
 */
public struct CloseSheetImage: View {
    /// An empty initializer is required when importing AppleKit for use in other projects.
    public init() {}

    public var body: some View {
        // TODO: Add support for iOS 14 and below.
        Image(systemName: "xmark.circle.fill")
            .accessibilityLabel("Close")
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                Color.secondary,
                Color(uiColor: .tertiarySystemFill)
            )
    }
}

struct CloseSheetImage_Previews: PreviewProvider {
    static var previews: some View {
        Button {

        } label: {
            CloseSheetImage()
        }
    }
}
#endif
