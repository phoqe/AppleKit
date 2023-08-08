import SwiftUI

internal struct OnboardingTabView<Content: View>: View {
    
    @ViewBuilder
    let content: Content
    
    var body: some View {
        content
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView {
            Text("Hello, World!")
        }
    }
}
