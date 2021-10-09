#if os(iOS)
import SwiftUI

/**
 A stylized SF Symbol that appears in apps by Apple, e.g., Find My and Maps.
 You can use it in multiple environments but more specifically as a close button in an iOS Sheet view.

 - Requires: The symbol is only available on iOS 15 and later.
 - Remark: The SF Symbol in use is `xmark.circle.fill`.
 */
@available(iOS 15.0, *)
public struct CloseSheetImage: View {
    public init() {}
    public var body: some View {
        Image(systemName: "xmark.circle.fill")
            .accessibilityLabel("Close")
            .symbolRenderingMode(.palette)
            .foregroundStyle(
                Color.secondary,
                Color(uiColor: .tertiarySystemFill)
            )
    }
}

@available(iOS 15.0, *)
struct CloseSheetImage_Previews: PreviewProvider {
    static var previews: some View {
        Button {

        } label: {
            CloseSheetImage()
        }
    }
}
#endif
