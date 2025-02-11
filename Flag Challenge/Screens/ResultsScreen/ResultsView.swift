import SwiftUI

struct ResultsView: View {
    @StateObject var viewModel: ResultsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            backgroundGradient()
                .ignoresSafeArea()
            content
                .padding()
        }
    }
}

extension ResultsView {
    private var content: some View {
        VStack(spacing: 30) {
            Spacer()
            headerView
            scoreContainerView
            progressBarView
            Spacer()
            restartButton
            Spacer()
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("Game Over")
                .font(.resultsHeader)
                .foregroundColor(.white)
            Text(viewModel.performanceText())
                .font(.resultsPerformance)
                .foregroundColor(.white)
        }
    }
    
    private var scoreContainerView: some View {
        VStack(spacing: 10) {
            Text("Your Score")
                .font(.resultsScoreTitle)
                .foregroundColor(.secondary)
            Text("\(viewModel.score)/5")
                .font(.resultsScoreValue)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    private var progressBarView: some View {
        ProgressBar(score: viewModel.scorePercentage())
    }
    
    private var restartButton: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Restart Game")
                .font(.restartButton)
        }
        .buttonStyle(RestartButtonStyle())
    }
}

#Preview {
    ResultsAssembly().build(with: 3)
}
