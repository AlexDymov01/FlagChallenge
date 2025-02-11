import UIKit
import SwiftUI

// MARK: - Models

struct CountryDialCode: Decodable {
    let name: String
    let code: String
}

struct CountryModel: Identifiable {
    let id = UUID()
    let name: String
    let countryImage: UIImage?
}
