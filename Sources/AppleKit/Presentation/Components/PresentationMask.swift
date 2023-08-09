import SwiftUI

struct PresentationMask: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.primary, .primary.opacity(0)]), startPoint: UnitPoint(x: 0.5, y: 0.85), endPoint: .bottom)
    }
}

struct PresentationMask_Previews: PreviewProvider {
    static var previews: some View {
        PresentationMask()
    }
}
