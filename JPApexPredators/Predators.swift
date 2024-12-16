//
//  Predators.swift
//  JPApexPredators
//
//  Created by Bhavin Bhadani on 13/12/24.
//

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorsData()
    }
    
    func decodeApexPredatorsData() {
        guard let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            apexPredators = try decoder.decode([ApexPredator].self, from: data)
        } catch {
            print("Eror deoding JSON: \(String(describing: error))")
        }
    }
    
    func search(for term: String) -> [ApexPredator] {
        if term.isEmpty {
            return apexPredators
        }
        return apexPredators.filter { $0.name.localizedCaseInsensitiveContains(term) }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                return predator1.name < predator2.name
            }
            return predator1.id < predator2.id
        }
    }
}
