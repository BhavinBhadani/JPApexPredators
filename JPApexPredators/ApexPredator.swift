//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Bhavin Bhadani on 13/12/24.
//

import Foundation

struct ApexPredator: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable {
        let id: String
        let movie: String
        let sceneDescription: String
    }
}
