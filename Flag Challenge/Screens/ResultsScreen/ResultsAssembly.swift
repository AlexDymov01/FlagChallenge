import SwiftUI

struct ResultsAssembly {
    
    @MainActor
    func build(with score: Int) -> some View {
        let viewModel = ResultsViewModel(score: score)
        return ResultsView(viewModel: viewModel)
    }
}
