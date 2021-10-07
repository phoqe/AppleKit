#if os(iOS)
import SwiftUI

struct CloseSheetImage: View {
    var body: some View {
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
