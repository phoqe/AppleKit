import SwiftUI

@available(iOS 15.0, *)
public struct OnboardingView<Content: View>: View {
    
    @Binding
    var selection: Int
    
    let tabs: [Content]
    
    public var body: some View {
        TabView(selection: $selection) {
            ForEach(tabs.indices, id: \.self) { index in
                tabs[index]
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .interactiveDismissDisabled()
    }
}

@available(iOS 15.0, *)
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Onboarding")
            .sheet(isPresented: .constant(true)) {
                OnboardingView(selection: .constant(0), tabs: [Text("1"), Text("2"), Text("3")])
            }
    }
}

