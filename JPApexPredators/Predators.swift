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
}
