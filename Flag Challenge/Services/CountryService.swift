import Foundation

final class CountryService {
    static let shared = CountryService()
    
    private init() {}
    
    func parseCountriesList() -> [CountryDialCode] {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json") else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let countryDialCodes = try JSONDecoder().decode([CountryDialCode].self, from: data)
            return countryDialCodes
        } catch {
            return []
        }
    }
    
    func getFlag(from countryCode: String) -> String {
        countryCode
            .unicodeScalars
            .map { 127_397 + $0.value }
            .compactMap(UnicodeScalar.init)
            .map { String($0) }
            .joined()
    }
    
    func createCountryModels() -> [CountryModel] {
        let countryDialCodes = parseCountriesList()
        
        return countryDialCodes.map { country in
            let flagEmoji = getFlag(from: country.code)
            let image = flagEmoji.textToImage()
            
            return CountryModel(
                name: country.name,
                countryImage: image
            )
        }
    }
}
