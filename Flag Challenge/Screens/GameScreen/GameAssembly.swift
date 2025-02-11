import SwiftUI

struct GameAssembly {
    
    @MainActor
    func build() -> some View {
        let viewModel = GameViewModel()
        return GameView(viewModel: viewModel)
    }
}
