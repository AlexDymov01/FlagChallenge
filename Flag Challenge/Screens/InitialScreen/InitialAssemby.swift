import SwiftUI

struct InitialScreenAssembly {
    
    @MainActor
    func build() -> some View {
        let viewModel = InitialScreenViewModel()
        return InitialScreenView(viewModel: viewModel)
    }
}
