import SwiftUI

struct ProgressBar: View {
    let score: Double
    
    var body: some View {
        VStack {
            Text("Correct Answers")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 20)
                        .foregroundColor(Color.white.opacity(0.3))
                    Capsule()
                        .frame(width: geometry.size.width * CGFloat(score),
                               height: 20)
                        .foregroundColor(.blue)
                }
            }
            .frame(height: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.greyStroke.opacity(0.4), lineWidth: 1)
            )
            .padding(.horizontal)
        }
    }
}
