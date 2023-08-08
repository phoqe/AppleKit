import SwiftUI

@available(iOS 15.0, *)
public struct OnboardingView: View {
    
    @StateObject
    private var viewModel: OnboardingViewModel
    
    private let tabs: [AnyView]
    
    public init(
        tabs: [AnyView]
    ) {
        self._viewModel = StateObject(
            wrappedValue: OnboardingViewModel(
                dismiss: Environment(\.dismiss).wrappedValue
            )
        )
        
        self.tabs = tabs
    }
    
    public var body: some View {
        TabView(selection: $viewModel.currentTab) {
            ForEach(0..<tabs.count, id: \.self) { index in
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
                OnboardingView(tabs: [AnyView(Text("1")), AnyView(Text("2"))])
            }
    }
}
