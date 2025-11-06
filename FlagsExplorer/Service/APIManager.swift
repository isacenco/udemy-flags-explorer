//
//  APIManager.swift
//  FlagsExplorer
//
//  Created by Ghenadie Isacenco on 6/11/25.
//

import SwiftUI

enum APIError: Error {
    case invalidURL
}

class APIManager {
    func fetchCountriesByContinent(continent: String) async throws -> [CountryElement] {
        guard let url = URL(string: "https://restcountries.com/v3.1/region/\(continent)") else {
            throw APIError.invalidURL
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let countries: [CountryElement] = try JSONDecoder().decode([CountryElement].self, from: data)
        
        return countries
    }
}

struct CountryElement: Codable, Identifiable {
    var id = UUID()
    let name: Name
    let flags: Flags
    
    private enum CodingKeys: String, CodingKey {
        case name
        case flags
    }
}

struct Name: Codable {
    let common: String
}

struct Flags: Codable {
    let png: String
}
