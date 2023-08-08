import SwiftUI

@available(iOS 15.0, *)
class OnboardingViewModel: ObservableObject {
    
    let dismiss: DismissAction
    let numberOfTabs: Int
    
    init(
        dismiss: DismissAction,
        numberOfTabs: Int
    ) {
        self.dismiss = dismiss
        self.numberOfTabs = numberOfTabs
    }
    
    @Published
    var currentTab: Int = 0
    
    func nextTab() {
        if currentTab < numberOfTabs - 1 {
            currentTab = currentTab + 1
        } else {
            finish()
        }
    }
    
    func previousTab() {
        if currentTab > 0 {
            currentTab = currentTab - 1
        }
    }
    
    func finish() {
        dismiss()
    }
}

@available(iOS 15.0, *)
public struct OnboardingView<Content: View>: View {
    
    private let tabs: [Content]
    
    @StateObject
    private var viewModel: OnboardingViewModel
    
    public init(
        tabs: [Content]
    ) {
        self._viewModel = StateObject(
            wrappedValue: OnboardingViewModel(
                dismiss: Environment(\.dismiss).wrappedValue,
                numberOfTabs: tabs.count
            )
        )
        
        self.tabs = tabs
    }
    
    public var body: some View {
        TabView(selection: $viewModel.currentTab) {
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
                OnboardingView(tabs: [Text("1"), Text("2"), Text("3")])
            }
    }
}

