//
//  FlagsDetailViewModel.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import Foundation

@Observable
class FlagsDetailViewModel {
    var countries: [CountryElement] = []
    var errorMessage: String?
    
    func getCountriesByContinent(continent: String, apiManager: APIManager = APIManager()) async {
        Task {
            do {
                let countriesList = try await apiManager.fetchCountriesByContinent(continent: continent)
                self.countries = countriesList
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
