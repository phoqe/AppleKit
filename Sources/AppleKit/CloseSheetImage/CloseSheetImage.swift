#if os(iOS)
import SwiftUI

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
