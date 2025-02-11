import SwiftUI

// MARK: - Nav Bar

extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}

// MARK: - Frame Modifier

extension View {
    func frame(size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
}

// MARK: - Gradients

extension View {
    func selectionButtonGradient() -> LinearGradient {
        let gradient = LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.selectionButtonGradientBackground1,
                    Color.selectionButtonGradientBackground2,
                    Color.selectionButtonGradientBackground3
                ]
            ),
            startPoint: .leading,
            endPoint: .trailing
        )
        
        return gradient
    }
    
    func backgroundGradient() -> LinearGradient {
        let gradient = LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.purple, Color.blue
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        return gradient
    }
}

extension LinearGradient {
    static var selectionButton: LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [
                Color.selectionButtonGradientBackground1,
                Color.selectionButtonGradientBackground2,
                Color.selectionButtonGradientBackground3
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
